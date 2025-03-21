import 'dart:io';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:dart_style/dart_style.dart';
import 'package:pub_semver/pub_semver.dart';
import 'package:shell_command_generator/shell_command_generator.dart';
import 'package:test/test.dart';

String format(String code, Version version) => DartFormatter(languageVersion: version, pageWidth: 120).format(code);

final _builderOptions = BuilderOptions({'formatter': format});

Map<String, String> resource(String name) =>
    {'shell_command_generator|test/resources/$name.dart': File('test/resources/$name.dart').readAsStringSync()};

Map<String, String> output(String name) {
  final file = 'test/resources/$name.shell_command_generator.g.part';
  return {'shell_command_generator|$file': File(file).readAsStringSync()};
}

Future _builder(String resourceName, PackageAssetReader assetReader) => testBuilder(
      shellCommandGeneratorBuilder(_builderOptions),
      resource(resourceName),
      outputs: output(resourceName),
      reader: assetReader,
    );

Future<void> main() async {
  final assetReader = await PackageAssetReader.currentIsolate();
  group('Generators', () {
    test('success_base', () => _builder('success_base', assetReader));
    test('success_dollar', () => _builder('success_dollar', assetReader));
    test('success_quotes', () => _builder('success_quotes', assetReader));
    test('success_multiline', () => _builder('success_multiline', assetReader));
    test('success_multiple_annotations', () => _builder('success_multiple_annotations', assetReader));
  });
}
