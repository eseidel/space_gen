// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsMoveCard201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsMoveCard201Response();
      final parsed = ProjectsMoveCard201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsMoveCard201Response.maybeFromJson(null), isNull);
    });
  });
}
