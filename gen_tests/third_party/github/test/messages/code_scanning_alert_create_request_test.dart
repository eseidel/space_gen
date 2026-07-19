// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAlertCreateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAlertCreateRequest(false);
      final parsed = CodeScanningAlertCreateRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAlertCreateRequest.maybeFromJson(null), isNull);
    });
  });
}
