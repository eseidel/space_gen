// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateBranchProtectionRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateBranchProtectionRequest(
        requiredStatusChecks:
            ReposUpdateBranchProtectionRequestRequiredStatusChecks(
              strict: false,
              contexts: <String>['example'],
            ),
        enforceAdmins: false,
        requiredPullRequestReviews:
            ReposUpdateBranchProtectionRequestRequiredPullRequestReviews(),
        restrictions: ReposUpdateBranchProtectionRequestRestrictions(
          users: <String>['example'],
          teams: <String>['example'],
        ),
      );
      final parsed = ReposUpdateBranchProtectionRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateBranchProtectionRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposUpdateBranchProtectionRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
