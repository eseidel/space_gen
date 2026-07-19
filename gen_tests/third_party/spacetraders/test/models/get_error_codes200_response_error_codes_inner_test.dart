// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetErrorCodes200ResponseErrorCodesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetErrorCodes200ResponseErrorCodesInner(
        code: 0,
        name: 'example',
      );
      final parsed = GetErrorCodes200ResponseErrorCodesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        GetErrorCodes200ResponseErrorCodesInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetErrorCodes200ResponseErrorCodesInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
