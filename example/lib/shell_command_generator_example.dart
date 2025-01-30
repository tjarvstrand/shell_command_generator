import 'package:shell_command_generator/shell_command_generator.dart';

part 'shell_command_generator_example.g.dart';

@Shell('ls')
const String files = _$files;

void main() {
  print(files);
}
