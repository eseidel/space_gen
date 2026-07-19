// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAlertEnvironment', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAlertEnvironment('example');
      final parsed = CodeScanningAlertEnvironment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAlertEnvironment.maybeFromJson(null), isNull);
    });
  });
}
