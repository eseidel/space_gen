// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAndAnalysisSecretScanning', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecurityAndAnalysisSecretScanning();
      final parsed = SecurityAndAnalysisSecretScanning.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecurityAndAnalysisSecretScanning.maybeFromJson(null), isNull);
    });
  });
}
