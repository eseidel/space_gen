// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetMyFactions200ResponseDataInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetMyFactions200ResponseDataInner(
        symbol: 'example',
        reputation: 0,
      );
      final parsed = GetMyFactions200ResponseDataInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetMyFactions200ResponseDataInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetMyFactions200ResponseDataInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
