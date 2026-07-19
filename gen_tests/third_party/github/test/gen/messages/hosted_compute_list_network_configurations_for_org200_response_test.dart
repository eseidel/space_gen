// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('HostedComputeListNetworkConfigurationsForOrg200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = HostedComputeListNetworkConfigurationsForOrg200Response(
        totalCount: 0,
        networkConfigurations: <NetworkConfiguration>[
          NetworkConfiguration(
            id: '123ABC456DEF789',
            name: 'my-network-configuration',
            createdOn: DateTime.utc(2024),
          ),
        ],
      );
      final parsed =
          HostedComputeListNetworkConfigurationsForOrg200Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        HostedComputeListNetworkConfigurationsForOrg200Response.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            HostedComputeListNetworkConfigurationsForOrg200Response.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
