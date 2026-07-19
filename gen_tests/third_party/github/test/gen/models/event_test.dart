// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Event', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Event(
        id: 'example',
        type: 'example',
        actor: Actor(
          id: 0,
          login: 'example',
          gravatarId: 'example',
          url: Uri.parse('https://example.com'),
          avatarUrl: Uri.parse('https://example.com'),
        ),
        repo: EventRepo(
          id: 0,
          name: 'example',
          url: Uri.parse('https://example.com'),
        ),
        payload: const EventPayload(),
        public: false,
        createdAt: DateTime.utc(2024),
      );
      final parsed = Event.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Event.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Event.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
