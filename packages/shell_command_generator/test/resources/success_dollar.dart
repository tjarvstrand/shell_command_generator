import 'package:shell_command_generator_annotation/shell_command_generator_annotation.dart';

part 'success_dollar.g.dart';

@Shell('echo', arguments: ['-n', r'$bla'])
const String echo = _$echo;
