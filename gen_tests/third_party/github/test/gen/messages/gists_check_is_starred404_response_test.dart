// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistsCheckIsStarred404Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistsCheckIsStarred404Response();
      final parsed = GistsCheckIsStarred404Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistsCheckIsStarred404Response.maybeFromJson(null), isNull);
    });
  });
}
