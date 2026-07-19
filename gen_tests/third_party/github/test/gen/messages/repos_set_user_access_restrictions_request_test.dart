// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposSetUserAccessRestrictionsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposSetUserAccessRestrictionsRequest(
        users: <String>['example'],
      );
      final parsed = ReposSetUserAccessRestrictionsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposSetUserAccessRestrictionsRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposSetUserAccessRestrictionsRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
