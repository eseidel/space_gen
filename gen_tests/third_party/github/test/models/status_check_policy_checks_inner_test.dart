// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('StatusCheckPolicyChecksInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = StatusCheckPolicyChecksInner(
        context: 'continuous-integration/travis-ci',
        appId: 0,
      );
      final parsed = StatusCheckPolicyChecksInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(StatusCheckPolicyChecksInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => StatusCheckPolicyChecksInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
