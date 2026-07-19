// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('HookDelivery', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = HookDelivery(
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
        request: const HookDeliveryRequest(
          headers: {'key': <String, dynamic>{}},
          payload: {'key': <String, dynamic>{}},
        ),
        response: const HookDeliveryResponse(
          headers: {'key': <String, dynamic>{}},
          payload: 'example',
        ),
      );
      final parsed = HookDelivery.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(HookDelivery.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => HookDelivery.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
