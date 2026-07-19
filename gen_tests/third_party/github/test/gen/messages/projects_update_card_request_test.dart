// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsUpdateCardRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsUpdateCardRequest();
      final parsed = ProjectsUpdateCardRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsUpdateCardRequest.maybeFromJson(null), isNull);
    });
  });
}
