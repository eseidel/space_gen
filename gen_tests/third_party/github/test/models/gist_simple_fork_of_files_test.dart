// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistSimpleForkOfFiles', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistSimpleForkOfFiles();
      final parsed = GistSimpleForkOfFiles.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistSimpleForkOfFiles.maybeFromJson(null), isNull);
    });
  });
}
