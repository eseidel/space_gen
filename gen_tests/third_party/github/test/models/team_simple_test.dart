// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamSimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TeamSimple(
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
      );
      final parsed = TeamSimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamSimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamSimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
