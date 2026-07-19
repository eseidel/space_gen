// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningAlertResolutionComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecretScanningAlertResolutionComment('example');
      final parsed = SecretScanningAlertResolutionComment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningAlertResolutionComment.maybeFromJson(null), isNull);
    });
  });
}
