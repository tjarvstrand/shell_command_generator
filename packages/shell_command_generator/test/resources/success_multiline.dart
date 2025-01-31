import 'package:shell_command_generator_annotation/shell_command_generator_annotation.dart';

part 'success_multiline.g.dart';

@Shell('echo', arguments: ['-n', 'foo\nbar'])
const String echo = _$echo;
