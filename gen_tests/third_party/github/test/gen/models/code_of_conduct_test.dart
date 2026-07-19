// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeOfConduct', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeOfConduct(
        key: 'contributor_covenant',
        name: 'Contributor Covenant',
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
      );
      final parsed = CodeOfConduct.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeOfConduct.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeOfConduct.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
