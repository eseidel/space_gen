// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckRunOutput', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CheckRunOutput(
        title: 'example',
        summary: 'example',
        text: 'example',
        annotationsCount: 0,
        annotationsUrl: Uri.parse('https://example.com'),
      );
      final parsed = CheckRunOutput.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CheckRunOutput.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CheckRunOutput.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
