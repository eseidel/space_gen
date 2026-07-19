// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsMoveCard503Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsMoveCard503Response();
      final parsed = ProjectsMoveCard503Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsMoveCard503Response.maybeFromJson(null), isNull);
    });
  });
}
