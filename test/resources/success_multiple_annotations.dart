import 'package:shell_command_generator/shell_command_generator.dart';

part 'success_multiple_annotations.g.dart';

@Shell('echo', arguments: ['-n', 'one'])
const String echo1 = _$echo1;

@Shell('echo', arguments: ['-n', 'two'])
const String echo2 = _$echo2;
