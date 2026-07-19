// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('NetworkSettings', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = NetworkSettings(
        id: '220F78DACB92BBFBC5E6F22DE1CCF52309D',
        name: 'my-network-settings',
        subnetId:
            '/subscriptions/14839728-3ad9-43ab-bd2b-fa6ad0f75e2a/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet/subnets/my-subnet',
        region: 'eastus',
      );
      final parsed = NetworkSettings.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(NetworkSettings.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => NetworkSettings.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
