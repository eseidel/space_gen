// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsDelete403Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsDelete403Response();
      final parsed = ProjectsDelete403Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsDelete403Response.maybeFromJson(null), isNull);
    });
  });
}
