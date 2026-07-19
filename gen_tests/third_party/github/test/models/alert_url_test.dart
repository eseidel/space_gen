// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AlertUrl', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AlertUrl(Uri.parse('https://example.com'));
      final parsed = AlertUrl.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AlertUrl.maybeFromJson(null), isNull);
    });
  });
}
