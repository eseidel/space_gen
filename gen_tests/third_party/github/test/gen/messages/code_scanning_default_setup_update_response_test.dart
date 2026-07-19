// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningDefaultSetupUpdateResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningDefaultSetupUpdateResponse();
      final parsed = CodeScanningDefaultSetupUpdateResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningDefaultSetupUpdateResponse.maybeFromJson(null),
        isNull,
      );
    });
  });
}
