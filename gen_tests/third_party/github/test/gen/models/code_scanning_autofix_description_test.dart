// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAutofixDescription', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAutofixDescription('example');
      final parsed = CodeScanningAutofixDescription.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAutofixDescription.maybeFromJson(null), isNull);
    });
  });
}
