// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryCvss', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RepositoryAdvisoryCvss(
        vectorString: 'example',
        score: 0,
      );
      final parsed = RepositoryAdvisoryCvss.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryAdvisoryCvss.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryCvss.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
