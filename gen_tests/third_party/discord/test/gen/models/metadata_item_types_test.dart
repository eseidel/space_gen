// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MetadataItemTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MetadataItemTypes.integerLessThanEqual;
      final parsed = MetadataItemTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MetadataItemTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(() => MetadataItemTypes.maybeFromJson(-1), throwsFormatException);
    });

    test('toString matches toJson for every value', () {
      for (final value in MetadataItemTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MetadataItemTypes.values) {
        expect(MetadataItemTypes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
