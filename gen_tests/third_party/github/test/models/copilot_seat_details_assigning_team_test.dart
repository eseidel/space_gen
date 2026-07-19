// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotSeatDetailsAssigningTeam', () {
    test('EnterpriseTeam round-trips via maybeFromJson/toJson', () {
      final instance = EnterpriseTeam(
        id: 0,
        name: 'example',
        slug: 'example',
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        membersUrl: 'example',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = EnterpriseTeam.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotSeatDetailsAssigningTeam.maybeFromJson(null), isNull);
    });
  });
}
