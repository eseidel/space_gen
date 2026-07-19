// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositorySubscription', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RepositorySubscription(
        subscribed: false,
        ignored: false,
        reason: 'example',
        createdAt: DateTime.utc(2024),
        url: Uri.parse('https://example.com'),
        repositoryUrl: Uri.parse('https://example.com'),
      );
      final parsed = RepositorySubscription.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositorySubscription.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositorySubscription.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
