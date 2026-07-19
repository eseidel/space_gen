// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgHook', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgHook(
        id: 1,
        url: Uri.parse('https://example.com'),
        pingUrl: Uri.parse('https://example.com'),
        name: 'web',
        events: const <String>['example'],
        active: false,
        config: const OrgHookConfig(),
        updatedAt: DateTime.utc(2024),
        createdAt: DateTime.utc(2024),
        type: 'example',
      );
      final parsed = OrgHook.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgHook.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgHook.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
