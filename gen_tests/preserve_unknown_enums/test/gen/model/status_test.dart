// GENERATED — do not hand-edit.
import 'package:preserve_unknown_enums/api.dart';
import 'package:test/test.dart';

void main() {
  group('Status', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Status.open;
      final parsed = Status.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Status.maybeFromJson(null), isNull);
    });

    test('fromJson round-trips unknown values via raw', () {
      final parsed = Status.fromJson('__invalid_enum_value__');
      expect(parsed, isA<StatusUnknown>());
      expect(parsed.toJson(), equals('__invalid_enum_value__'));
    });

    test('toString matches toJson for every value', () {
      for (final value in Status.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in Status.values) {
        expect(Status.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
