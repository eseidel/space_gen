// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateUserPlan', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PrivateUserPlan(
        collaborators: 0,
        name: 'example',
        space: 0,
        privateRepos: 0,
      );
      final parsed = PrivateUserPlan.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PrivateUserPlan.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PrivateUserPlan.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
