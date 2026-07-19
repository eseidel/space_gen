// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckAutomatedSecurityFixes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CheckAutomatedSecurityFixes(
        enabled: false,
        paused: false,
      );
      final parsed = CheckAutomatedSecurityFixes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CheckAutomatedSecurityFixes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CheckAutomatedSecurityFixes.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
