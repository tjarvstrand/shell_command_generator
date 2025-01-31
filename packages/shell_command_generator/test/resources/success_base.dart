import 'package:shell_command_generator_annotation/shell_command_generator_annotation.dart';

part 'success_base.g.dart';

@Shell('echo', arguments: ['-n', 'bla'])
const String echo = _$echo;

int foo() => 1;
