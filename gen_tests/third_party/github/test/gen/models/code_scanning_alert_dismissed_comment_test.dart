// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAlertDismissedComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAlertDismissedComment('example');
      final parsed = CodeScanningAlertDismissedComment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAlertDismissedComment.maybeFromJson(null), isNull);
    });
  });
}
