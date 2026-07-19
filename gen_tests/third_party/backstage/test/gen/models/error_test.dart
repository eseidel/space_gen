// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('Error', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Error(
        error: ErrorError(name: 'example', message: 'example'),
        response: ErrorResponse(statusCode: 0),
        entries: <String, dynamic>{},
      );
      final parsed = Error.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Error.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Error.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
