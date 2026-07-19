// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsUpdate403Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsUpdate403Response();
      final parsed = ProjectsUpdate403Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsUpdate403Response.maybeFromJson(null), isNull);
    });
  });
}
