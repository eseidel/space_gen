// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetMyAccount200ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetMyAccount200ResponseData(
        account: GetMyAccount200ResponseDataAccount(
          id: 'example',
          email: 'example',
          createdAt: DateTime.utc(2024),
        ),
      );
      final parsed = GetMyAccount200ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetMyAccount200ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetMyAccount200ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
