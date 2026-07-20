// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('HostedComputeCreateNetworkConfigurationForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = HostedComputeCreateNetworkConfigurationForOrgRequest(
        name: 'example',
        networkSettingsIds: const <String>['example'],
      );
      final parsed =
          HostedComputeCreateNetworkConfigurationForOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        HostedComputeCreateNetworkConfigurationForOrgRequest.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            HostedComputeCreateNetworkConfigurationForOrgRequest.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
