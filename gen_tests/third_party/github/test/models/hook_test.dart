// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Hook', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Hook(
        type: 'example',
        id: 42,
        name: 'web',
        active: false,
        events: const <String>['example'],
        config: const WebhookConfig(),
        updatedAt: DateTime.utc(2024),
        createdAt: DateTime.utc(2024),
        url: Uri.parse('https://example.com'),
        testUrl: Uri.parse('https://example.com'),
        pingUrl: Uri.parse('https://example.com'),
        lastResponse: const HookResponse(
          code: 0,
          status: 'example',
          message: 'example',
        ),
      );
      final parsed = Hook.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Hook.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Hook.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
