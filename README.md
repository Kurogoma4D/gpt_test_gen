
This tool generates test codes for Dart code, using OpenAI API.

## Getting started

```
$ dart pub add dev:gpt_test_gen
```


## Usage

Just execute below command.

```
$ dart run gpt_test_gen -t <token> -i <your_source_file_path>
```

`<token>` is your OpenAI API's secret.
`<your_source_file_path>` is relative path of the source code for which you want the test code to be written.

## Reference

This package is inspired in [XCTestGen](https://github.com/NakaokaRei/XCTestGen).

OpenAI API: https://platform.openai.com/docs/introduction/overview.