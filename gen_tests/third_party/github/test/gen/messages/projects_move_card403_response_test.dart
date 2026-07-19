// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsMoveCard403Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsMoveCard403Response();
      final parsed = ProjectsMoveCard403Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsMoveCard403Response.maybeFromJson(null), isNull);
    });
  });
}
