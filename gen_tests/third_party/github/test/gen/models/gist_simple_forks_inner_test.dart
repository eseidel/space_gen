// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistSimpleForksInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistSimpleForksInner();
      final parsed = GistSimpleForksInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistSimpleForksInner.maybeFromJson(null), isNull);
    });
  });
}
