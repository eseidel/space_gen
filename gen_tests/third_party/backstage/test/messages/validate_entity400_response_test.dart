// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('ValidateEntity400Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ValidateEntity400Response(
        errors: <ValidateEntity400ResponseErrorsInner>[
          ValidateEntity400ResponseErrorsInner(
            name: 'example',
            message: 'example',
            entries: <String, dynamic>{},
          ),
        ],
      );
      final parsed = ValidateEntity400Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ValidateEntity400Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ValidateEntity400Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
