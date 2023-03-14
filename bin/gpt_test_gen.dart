import 'dart:io';

import 'package:args/args.dart';
import 'package:gpt_test_gen/src/gpt_test_generator.dart';

const _tokenKey = 'token';
const _inputKey = 'input';
const _maxTokensKey = 'max-tokens';

void main(List<String> args) async {
  final argParser = ArgParser()
    ..addOption(_tokenKey, abbr: 't')
    ..addOption(_inputKey, abbr: 'i')
    ..addOption(_maxTokensKey);
  final result = argParser.parse(args);

  final token = result[_tokenKey] as String?;
  if (token == null) {
    print('Please specify OpenAI API token like: `-t <token>`');
    exit(1);
  }

  final inputPath = result[_inputKey] as String?;
  if (inputPath == null) {
    print('Please specify original source file path like: `-i lib/foo.dart`');
    exit(1);
  }

  final generator = GptTestGenerator(token: token);
  await generator.generate(
    inputPath: inputPath,
    maxTokens: result[_maxTokensKey] as String?,
  );
}
