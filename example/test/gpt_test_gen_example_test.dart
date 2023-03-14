import 'package:gpt_test_gen_example/gpt_test_gen_example.dart';
import 'package:test/test.dart';

void main() {
  group("sum", () {
    test("returns the correct sum", () {
      expect(sum(2, 5), equals(7));
    });

    test("returns the correct sum when negative numbers are provided", () {
      expect(sum(-14, 6), equals(-8));
    });

    test("returns the correct sum at boundary values", () {
      expect(sum(0, 0), equals(0));
    });
  });

  group("replaceApple", () {
    test("returns the string with 'apple' replaced with 'grape'", () {
      expect(replaceApple("I love apples!"), equals("I love grapes!"));
    });
  });
}
