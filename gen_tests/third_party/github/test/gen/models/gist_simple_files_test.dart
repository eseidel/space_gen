// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistSimpleFiles', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistSimpleFiles();
      final parsed = GistSimpleFiles.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistSimpleFiles.maybeFromJson(null), isNull);
    });
  });
}
