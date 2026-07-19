// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadSubscription', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ThreadSubscription(
        subscribed: false,
        ignored: false,
        reason: 'example',
        createdAt: DateTime.utc(2024),
        url: Uri.parse('https://example.com'),
      );
      final parsed = ThreadSubscription.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadSubscription.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadSubscription.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
