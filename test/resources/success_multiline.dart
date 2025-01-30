import 'package:shell_command_generator/shell_command_generator.dart';

part 'success_multiline.g.dart';

@Shell('echo', arguments: ['-n', 'foo\nbar'])
const String echo = _$echo;
