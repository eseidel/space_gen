// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningSarifsStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningSarifsStatus();
      final parsed = CodeScanningSarifsStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningSarifsStatus.maybeFromJson(null), isNull);
    });
  });
}
