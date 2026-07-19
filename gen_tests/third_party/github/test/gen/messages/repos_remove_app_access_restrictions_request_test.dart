// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposRemoveAppAccessRestrictionsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposRemoveAppAccessRestrictionsRequest(
        apps: <String>['example'],
      );
      final parsed = ReposRemoveAppAccessRestrictionsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposRemoveAppAccessRestrictionsRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposRemoveAppAccessRestrictionsRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
