// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PageBuildStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PageBuildStatus(
        url: Uri.parse('https://example.com'),
        status: 'queued',
      );
      final parsed = PageBuildStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PageBuildStatus.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PageBuildStatus.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
