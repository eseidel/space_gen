// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateBranchProtectionRequestRestrictions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateBranchProtectionRequestRestrictions(
        users: <String>['example'],
        teams: <String>['example'],
      );
      final parsed =
          ReposUpdateBranchProtectionRequestRestrictions.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposUpdateBranchProtectionRequestRestrictions.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposUpdateBranchProtectionRequestRestrictions.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
