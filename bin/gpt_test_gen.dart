import 'package:args/args.dart';
import 'package:gpt_test_gen/src/gpt_test_generator.dart';

const _tokenKey = 'token';
const _inputKey = 'input';

void main(List<String> args) async {
  final argParser = ArgParser()
    ..addOption(_tokenKey, abbr: 't')
    ..addOption(_inputKey, abbr: 'i');
  final result = argParser.parse(args);

  final generator = GptTestGenerator(token: result[_tokenKey]);
  await generator.generate(inputPath: result[_inputKey]);
}
