// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ForbiddenGistResponseBlock', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ForbiddenGistResponseBlock();
      final parsed = ForbiddenGistResponseBlock.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ForbiddenGistResponseBlock.maybeFromJson(null), isNull);
    });
  });
}
