// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackageTypeParam', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackageTypeParam.npm;
      final parsed = PackageTypeParam.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PackageTypeParam.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PackageTypeParam.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in PackageTypeParam.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PackageTypeParam.values) {
        expect(PackageTypeParam.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
