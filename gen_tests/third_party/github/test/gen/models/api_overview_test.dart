// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiOverview', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiOverview(verifiablePasswordAuthentication: false);
      final parsed = ApiOverview.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiOverview.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApiOverview.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
