// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AlertHtmlUrl', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AlertHtmlUrl(Uri.parse('https://example.com'));
      final parsed = AlertHtmlUrl.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AlertHtmlUrl.maybeFromJson(null), isNull);
    });
  });
}
