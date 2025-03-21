import 'package:shell_command_generator_annotation/shell_command_generator_annotation.dart';

part 'success_quotes.g.dart';

@Shell('echo', arguments: ['-n', "'bla'"])
const String echo = _$echo;

@Shell('echo', arguments: ['-n', "'''bla'''"])
const String echo2 = _$echo2;
