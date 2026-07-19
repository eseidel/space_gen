// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryUpdateCreditsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisoryUpdateCreditsInner(
        login: 'example',
        type: SecurityAdvisoryCreditTypes.analyst,
      );
      final parsed = RepositoryAdvisoryUpdateCreditsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryAdvisoryUpdateCreditsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryUpdateCreditsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
