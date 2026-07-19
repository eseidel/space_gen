// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposAddAppAccessRestrictionsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposAddAppAccessRestrictionsRequest(
        apps: <String>['example'],
      );
      final parsed = ReposAddAppAccessRestrictionsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposAddAppAccessRestrictionsRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposAddAppAccessRestrictionsRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
