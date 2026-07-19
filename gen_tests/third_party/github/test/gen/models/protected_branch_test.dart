// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranch', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProtectedBranch(url: Uri.parse('https://example.com'));
      final parsed = ProtectedBranch.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranch.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranch.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
