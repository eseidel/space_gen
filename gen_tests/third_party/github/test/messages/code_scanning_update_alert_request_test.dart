// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningUpdateAlertRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningUpdateAlertRequest(
        state: CodeScanningAlertSetState.open,
      );
      final parsed = CodeScanningUpdateAlertRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningUpdateAlertRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningUpdateAlertRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
