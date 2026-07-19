// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('StatusCheckPolicy', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = StatusCheckPolicy(
        url: Uri.parse('https://example.com'),
        strict: false,
        contexts: const <String>['example'],
        checks: const <StatusCheckPolicyChecksInner>[
          StatusCheckPolicyChecksInner(
            context: 'continuous-integration/travis-ci',
            appId: 0,
          ),
        ],
        contextsUrl: Uri.parse('https://example.com'),
      );
      final parsed = StatusCheckPolicy.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(StatusCheckPolicy.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => StatusCheckPolicy.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
