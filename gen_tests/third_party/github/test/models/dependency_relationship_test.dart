// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependencyRelationship', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependencyRelationship.direct;
      final parsed = DependencyRelationship.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependencyRelationship.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependencyRelationship.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in DependencyRelationship.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in DependencyRelationship.values) {
        expect(DependencyRelationship.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
