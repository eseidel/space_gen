// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesCodespaceMachinesForAuthenticatedUser200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodespacesCodespaceMachinesForAuthenticatedUser200Response(
            totalCount: 0,
            machines: <CodespaceMachine>[
              CodespaceMachine(
                name: 'standardLinux',
                displayName: '4 cores, 16 GB RAM, 64 GB storage',
                operatingSystem: 'linux',
                storageInBytes: 68719476736,
                memoryInBytes: 17179869184,
                cpus: 4,
                prebuildAvailability: CodespaceMachinePrebuildAvailability.none,
              ),
            ],
          );
      final parsed =
          CodespacesCodespaceMachinesForAuthenticatedUser200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesCodespaceMachinesForAuthenticatedUser200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodespacesCodespaceMachinesForAuthenticatedUser200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
