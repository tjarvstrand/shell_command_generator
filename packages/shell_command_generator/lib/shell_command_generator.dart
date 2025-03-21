import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:shell_command_generator_annotation/shell_command_generator_annotation.dart';
import 'package:source_gen/source_gen.dart';

Builder shellCommandGeneratorBuilder(BuilderOptions options) {
  final formatter = options.config['formatter'];
  return formatter == null
      ? SharedPartBuilder([_Generator()], 'shell_command_generator')
      // ignore: avoid_dynamic_calls
      : SharedPartBuilder([_Generator()], 'shell_command_generator', formatOutput: formatter);
}

extension _ConstantReaderExt on ConstantReader {
  ConstantReader? get nullable => isNull ? null : this;
  List<String> get stringListValue => listValue.map((arg) => arg.toStringValue()!).toList();
  Map<String, String> get stringMapValue =>
      mapValue.map((key, value) => MapEntry(key!.toStringValue()!, value!.toStringValue()!));
}

class _Generator extends GeneratorForAnnotation<Shell> {
  @override
  String toString() => 'ShellCommandGenerator';

  @override
  Stream<String> generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async* {
    final command = annotation.read('command').stringValue;
    final arguments = annotation.read('arguments').stringListValue;
    final workingDirectory = annotation.read('workingDirectory').nullable?.stringValue;
    final environment = annotation.read('environment').stringMapValue;
    final includeParentEnvironment = annotation.read('includeParentEnvironment').boolValue;
    final runInShell = annotation.read('runInShell').boolValue;

    final result = await Process.run(
      command,
      arguments,
      workingDirectory: workingDirectory,
      environment: environment,
      includeParentEnvironment: includeParentEnvironment,
      runInShell: runInShell,
    );
    if (result.exitCode != 0) {
      throw Exception(result.stderr);
    }

    final trim = annotation.read('trim').boolValue;

    final name = '_\$${element.name}';
    final output = (result.stdout as String).replaceAll("'", r"\'").replaceAll(r'$', r'\$');
    yield """const $name = '''${trim ? output.trim() : output}''';\n\n""";
  }
}
