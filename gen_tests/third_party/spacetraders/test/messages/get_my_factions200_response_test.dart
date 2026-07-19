// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetMyFactions200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetMyFactions200Response(
        data: <GetMyFactions200ResponseDataInner>[
          GetMyFactions200ResponseDataInner(symbol: 'example', reputation: 0),
        ],
        meta: Meta(total: 0, limit: 1),
      );
      final parsed = GetMyFactions200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetMyFactions200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetMyFactions200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
