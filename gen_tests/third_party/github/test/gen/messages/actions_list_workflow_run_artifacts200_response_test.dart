// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListWorkflowRunArtifacts200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsListWorkflowRunArtifacts200Response(
        totalCount: 0,
        artifacts: <Artifact>[
          Artifact(
            id: 5,
            nodeId: 'MDEwOkNoZWNrU3VpdGU1',
            name: 'AdventureWorks.Framework',
            sizeInBytes: 12345,
            url:
                'https://api.github.com/repos/github/hello-world/actions/artifacts/5',
            archiveDownloadUrl:
                'https://api.github.com/repos/github/hello-world/actions/artifacts/5/zip',
            expired: false,
            createdAt: DateTime.utc(2024),
            expiresAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
          ),
        ],
      );
      final parsed = ActionsListWorkflowRunArtifacts200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsListWorkflowRunArtifacts200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListWorkflowRunArtifacts200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
