// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsUpdateLegacyRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsUpdateLegacyRequest(name: 'example');
      final parsed = TeamsUpdateLegacyRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamsUpdateLegacyRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsUpdateLegacyRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
