// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommunityHealthFile', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommunityHealthFile(
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
      );
      final parsed = CommunityHealthFile.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommunityHealthFile.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommunityHealthFile.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
