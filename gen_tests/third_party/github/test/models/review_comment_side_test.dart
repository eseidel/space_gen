// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReviewCommentSide', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReviewCommentSide.left;
      final parsed = ReviewCommentSide.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReviewCommentSide.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReviewCommentSide.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReviewCommentSide.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReviewCommentSide.values) {
        expect(ReviewCommentSide.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
