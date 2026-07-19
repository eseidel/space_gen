// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeOfConductSimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeOfConductSimple(
        url: Uri.parse('https://example.com'),
        key: 'citizen_code_of_conduct',
        name: 'Citizen Code of Conduct',
        htmlUrl: Uri.parse('https://example.com'),
      );
      final parsed = CodeOfConductSimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeOfConductSimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeOfConductSimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
