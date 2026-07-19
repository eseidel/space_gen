// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DeploymentSimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DeploymentSimple(
        url: Uri.parse('https://example.com'),
        id: 42,
        nodeId: 'MDEwOkRlcGxveW1lbnQx',
        task: 'deploy',
        environment: 'production',
        description: 'Deploy request from hubot',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        statusesUrl: Uri.parse('https://example.com'),
        repositoryUrl: Uri.parse('https://example.com'),
      );
      final parsed = DeploymentSimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DeploymentSimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DeploymentSimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
