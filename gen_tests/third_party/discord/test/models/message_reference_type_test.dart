// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageReferenceType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MessageReferenceType.default_;
      final parsed = MessageReferenceType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageReferenceType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageReferenceType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MessageReferenceType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MessageReferenceType.values) {
        expect(MessageReferenceType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
