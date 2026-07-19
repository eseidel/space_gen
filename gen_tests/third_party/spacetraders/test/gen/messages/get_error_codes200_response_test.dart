// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetErrorCodes200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetErrorCodes200Response(
        errorCodes: <GetErrorCodes200ResponseErrorCodesInner>[
          GetErrorCodes200ResponseErrorCodesInner(code: 0, name: 'example'),
        ],
      );
      final parsed = GetErrorCodes200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetErrorCodes200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetErrorCodes200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
