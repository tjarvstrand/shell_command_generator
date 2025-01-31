import 'dart:io';

import 'package:meta/meta_meta.dart';

export 'dart:async' show StreamSubscription;

export 'package:meta/meta.dart' show protected;

/// An annotation indicating that a variable's value should be derived from a shell command.
///
/// By default trims whitespace from the output. If you want to preserve whitespace, set [trim] to false.
///
/// See [Process.run] for more information on other parameters.
@Target({TargetKind.topLevelVariable, TargetKind.getter, TargetKind.field, TargetKind.method, TargetKind.function})
class Shell {
  const Shell(
    this.command, {
    this.arguments = const [],
    this.workingDirectory,
    this.environment = const {},
    this.includeParentEnvironment = true,
    this.runInShell = false,
    this.trim = true,
  });

  final String command;
  final List<String> arguments;
  final String? workingDirectory;
  final Map<String, String> environment;
  final bool includeParentEnvironment;
  final bool runInShell;
  final bool trim;
}
