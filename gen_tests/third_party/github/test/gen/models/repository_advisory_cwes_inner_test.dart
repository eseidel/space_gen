// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryCwesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisoryCwesInner(
        cweId: 'example',
        name: 'example',
      );
      final parsed = RepositoryAdvisoryCwesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryAdvisoryCwesInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryCwesInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
