// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningRef', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningRef('example');
      final parsed = CodeScanningRef.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningRef.maybeFromJson(null), isNull);
    });
  });
}
