// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommunityProfileFiles', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommunityProfileFiles(
        codeOfConduct: CodeOfConductSimple(
          url: Uri.parse('https://example.com'),
          key: 'citizen_code_of_conduct',
          name: 'Citizen Code of Conduct',
          htmlUrl: Uri.parse('https://example.com'),
        ),
        codeOfConductFile: CommunityHealthFile(
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
        ),
        license: LicenseSimple(
          key: 'mit',
          name: 'MIT License',
          url: Uri.parse('https://example.com'),
          spdxId: 'MIT',
          nodeId: 'MDc6TGljZW5zZW1pdA==',
        ),
        contributing: CommunityHealthFile(
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
        ),
        readme: CommunityHealthFile(
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
        ),
        issueTemplate: CommunityHealthFile(
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
        ),
        pullRequestTemplate: CommunityHealthFile(
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
        ),
      );
      final parsed = CommunityProfileFiles.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommunityProfileFiles.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommunityProfileFiles.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
