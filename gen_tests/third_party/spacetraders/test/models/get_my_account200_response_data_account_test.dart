// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetMyAccount200ResponseDataAccount', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GetMyAccount200ResponseDataAccount(
        id: 'example',
        email: 'example',
        createdAt: DateTime.utc(2024),
      );
      final parsed = GetMyAccount200ResponseDataAccount.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetMyAccount200ResponseDataAccount.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetMyAccount200ResponseDataAccount.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
