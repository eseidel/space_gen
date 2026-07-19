// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningSarifsReceipt', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningSarifsReceipt();
      final parsed = CodeScanningSarifsReceipt.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningSarifsReceipt.maybeFromJson(null), isNull);
    });
  });
}
