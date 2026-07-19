// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsCreateCard503Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsCreateCard503Response();
      final parsed = ProjectsCreateCard503Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsCreateCard503Response.maybeFromJson(null), isNull);
    });
  });
}
