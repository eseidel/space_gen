// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PublicUserPlan', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PublicUserPlan(
        collaborators: 0,
        name: 'example',
        space: 0,
        privateRepos: 0,
      );
      final parsed = PublicUserPlan.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PublicUserPlan.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PublicUserPlan.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
