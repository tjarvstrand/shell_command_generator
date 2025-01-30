import 'package:shell_command_generator/shell_command_generator.dart';

part 'success_quotes.g.dart';

@Shell('echo', arguments: ['-n', "'bla'"])
const String echo = _$echo;
