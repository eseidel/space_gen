// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Environment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Environment(
        id: 56780428,
        nodeId: 'MDExOkVudmlyb25tZW50NTY3ODA0Mjg=',
        name: 'staging',
        url:
            'https://api.github.com/repos/github/hello-world/environments/staging',
        htmlUrl:
            'https://github.com/github/hello-world/deployments/activity_log?environments_filter=staging',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = Environment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Environment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Environment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
