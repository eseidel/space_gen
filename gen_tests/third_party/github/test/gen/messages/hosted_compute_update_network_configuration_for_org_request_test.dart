// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('HostedComputeUpdateNetworkConfigurationForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = HostedComputeUpdateNetworkConfigurationForOrgRequest();
      final parsed =
          HostedComputeUpdateNetworkConfigurationForOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        HostedComputeUpdateNetworkConfigurationForOrgRequest.maybeFromJson(
          null,
        ),
        isNull,
      );
    });
  });
}
