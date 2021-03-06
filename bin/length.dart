import 'dart:io';

import 'package:length/length.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  exitCode = 0;
  final parser = ArgParser()..addFlag('verbose', abbr: 'v');
  final result = parser.parse(arguments);
  var file = File(result.rest.first);
  if (result['verbose'] as bool) {
    print(result.rest.first);
  }
  try {
    Length(file).run(result['verbose'] as bool);
    if (!Platform.isWindows) print("");
  } catch (e) {
    print((e as ArgumentError).message);
    exitCode = 2;
  }
}
