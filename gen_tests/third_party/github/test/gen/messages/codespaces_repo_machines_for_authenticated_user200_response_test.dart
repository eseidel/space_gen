// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesRepoMachinesForAuthenticatedUser200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesRepoMachinesForAuthenticatedUser200Response(
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
          CodespacesRepoMachinesForAuthenticatedUser200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesRepoMachinesForAuthenticatedUser200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CodespacesRepoMachinesForAuthenticatedUser200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
