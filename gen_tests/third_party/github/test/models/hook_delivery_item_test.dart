// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('HookDeliveryItem', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = HookDeliveryItem(
        id: 42,
        guid: '58474f00-b361-11eb-836d-0e4f3503ccbe',
        deliveredAt: DateTime.utc(2024),
        redelivery: false,
        duration: 0.03,
        status: 'failed to connect',
        statusCode: 502,
        event: 'issues',
        action: 'opened',
        installationId: 123,
        repositoryId: 123,
      );
      final parsed = HookDeliveryItem.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(HookDeliveryItem.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => HookDeliveryItem.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
