// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Types200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Types200Response(
        date: DateType(DateTime(2024)),
        email: const EmailType('user@example.com'),
        uuid: const UuidType('00000000-0000-0000-0000-000000000000'),
        timestamp: Timestamp(DateTime.utc(2024)),
        widget: Widget(
          id: 0,
          tags: <String>['example'],
          attributes: {'key': 'example'},
        ),
      );
      final parsed = Types200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Types200Response.maybeFromJson(null), isNull);
    });
  });
}
