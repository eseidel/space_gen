// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsCreateCardRequest', () {
    test(
      'ProjectsCreateCardRequestOneOf0 round-trips via maybeFromJson/toJson',
      () {
        const instance = ProjectsCreateCardRequestOneOf0(
          note: 'Update all gems',
        );
        final parsed = ProjectsCreateCardRequestOneOf0.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'ProjectsCreateCardRequestOneOf1 round-trips via maybeFromJson/toJson',
      () {
        const instance = ProjectsCreateCardRequestOneOf1(
          contentId: 42,
          contentType: 'PullRequest',
        );
        final parsed = ProjectsCreateCardRequestOneOf1.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(ProjectsCreateCardRequest.maybeFromJson(null), isNull);
    });
  });
}
