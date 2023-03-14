import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class GptTestGenerator {
  final String token;

  GptTestGenerator({required this.token});

  Future<void> generate({required String inputPath}) async {
    final inputFile = File(inputPath);
    final original = await inputFile.readAsString();

    final outputPath = inputPath
        .replaceFirst(r'lib', 'test')
        .replaceFirst(r'.dart', '_test.dart');
    final outputFile = File(outputPath);

    final result = await _callApi(original);

    await outputFile.writeAsString(result);
  }

  Future<String> _callApi(String original) async {
    final url = Uri.parse('https://api.openai.com/v1/completions');
    final prompt =
        'Please write a unit test of the following Dart code. No explanatory text is required as we would like to save your output as source code as is. Test cases should also include boundary conditions.\n\n$original';
    print(prompt);
    final body = jsonEncode({
      "model": "text-davinci-003",
      "prompt": prompt,
      "max_tokens": 1000,
    });
    final result = await http.post(
      url,
      headers: {
        'Content-Type': ContentType.json.value,
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    final resultBody = jsonDecode(result.body);
    final choices = resultBody['choices'] as List<dynamic>?;
    if (choices == null) return '';
    final first = choices.first;
    final text = first['text'] as String?;
    return text ?? '';
  }
}
