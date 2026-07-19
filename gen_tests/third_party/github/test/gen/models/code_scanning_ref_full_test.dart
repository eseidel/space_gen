// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningRefFull', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningRefFull('refs/heads/main');
      final parsed = CodeScanningRefFull.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningRefFull.maybeFromJson(null), isNull);
    });
  });
}
