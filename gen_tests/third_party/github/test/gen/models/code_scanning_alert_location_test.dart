// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAlertLocation', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAlertLocation();
      final parsed = CodeScanningAlertLocation.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAlertLocation.maybeFromJson(null), isNull);
    });
  });
}
