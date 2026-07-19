// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContentTraffic', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ContentTraffic(
        path: '/github/hubot',
        title: 'github/hubot: A customizable life embetterment robot.',
        count: 3542,
        uniques: 2225,
      );
      final parsed = ContentTraffic.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContentTraffic.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContentTraffic.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
