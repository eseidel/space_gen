// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamRoleAssignment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TeamRoleAssignment(
        id: 0,
        nodeId: 'example',
        name: 'example',
        slug: 'example',
        description: 'example',
        permission: 'example',
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        membersUrl: 'example',
        repositoriesUrl: Uri.parse('https://example.com'),
        parent: TeamSimple(
          id: 1,
          nodeId: 'MDQ6VGVhbTE=',
          url: Uri.parse('https://example.com'),
          membersUrl:
              'https://api.github.com/organizations/1/team/1/members{/member}',
          name: 'Justice League',
          description: 'A great team.',
          permission: 'admin',
          htmlUrl: Uri.parse('https://example.com'),
          repositoriesUrl: Uri.parse('https://example.com'),
          slug: 'justice-league',
        ),
      );
      final parsed = TeamRoleAssignment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamRoleAssignment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamRoleAssignment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
