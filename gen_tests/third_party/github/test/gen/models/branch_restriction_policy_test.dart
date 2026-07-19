// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BranchRestrictionPolicy', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BranchRestrictionPolicy(
        url: Uri.parse('https://example.com'),
        usersUrl: Uri.parse('https://example.com'),
        teamsUrl: Uri.parse('https://example.com'),
        appsUrl: Uri.parse('https://example.com'),
        users: const <BranchRestrictionPolicyUsersInner>[
          BranchRestrictionPolicyUsersInner(),
        ],
        teams: const <BranchRestrictionPolicyTeamsInner>[
          BranchRestrictionPolicyTeamsInner(),
        ],
        apps: const <BranchRestrictionPolicyAppsInner>[
          BranchRestrictionPolicyAppsInner(),
        ],
      );
      final parsed = BranchRestrictionPolicy.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BranchRestrictionPolicy.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BranchRestrictionPolicy.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
