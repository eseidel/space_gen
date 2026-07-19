// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGetHostedRunnersMachineSpecsForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsGetHostedRunnersMachineSpecsForOrg200Response(
        totalCount: 0,
        machineSpecs: <ActionsHostedRunnerMachineSpec>[
          ActionsHostedRunnerMachineSpec(
            id: '8-core',
            cpuCores: 8,
            memoryGb: 32,
            storageGb: 300,
          ),
        ],
      );
      final parsed =
          ActionsGetHostedRunnersMachineSpecsForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsGetHostedRunnersMachineSpecsForOrg200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsGetHostedRunnersMachineSpecsForOrg200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
