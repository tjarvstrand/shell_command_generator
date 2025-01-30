import 'package:shell_command_generator/shell_command_generator.dart';

part 'success_dollar.g.dart';

@Shell('echo', arguments: ['-n', r'$bla'])
const String echo = _$echo;
