[![pub package](https://img.shields.io/pub/v/shell_command_generator.svg?label=shell_command_generator&color=blue)](https://pub.dev/packages/shell_command_generator)
[![popularity](https://img.shields.io/pub/popularity/shell_command_generator?logo=dart)](https://pub.dev/packages/shell_command_generator/score)
[![likes](https://img.shields.io/pub/likes/shell_command_generator?logo=dart)](https://pub.dev/packages/shell_command_generator/score)
[![pub points](https://img.shields.io/pub/points/shell_command_generator?logo=dart)](https://pub.dev/packages/shell_command_generator/score)
![building](https://github.com/tjarvstrand/shell_command_generator/workflows/shell_command_generator/badge.svg)

## Summary

Lightweight code generator that allows static access to the result of shell commands run at build 
time.

## Getting started

To use this package, add `shell_command_generator` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  shell_command_generator_annotation: ^0.1.0

dev_dependencies:
    build_runner: ^2.0.0
    shell_command_generator: ^0.1.0
```

    Then run `pub get` to install the package.

## Usage

In the part of your code where you want to access the result of a shell command, first add a part 
directive. Then add the `@Shell` annotation to any field, method, function, getter or variable, and 
provide the shell command and relevant other parameters, E.g.:

```dart
import 'package:shell_command_generator_annotation/shell_command_generator_annotation.dart';

part 'example.g.dart';

@Shell('ls', ['-l'], workingDirectory: '/path/to/directory')
const files = _$files;
```

