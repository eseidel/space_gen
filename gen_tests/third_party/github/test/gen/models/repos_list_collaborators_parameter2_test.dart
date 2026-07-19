// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposListCollaboratorsParameter2', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposListCollaboratorsParameter2.outside;
      final parsed = ReposListCollaboratorsParameter2.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposListCollaboratorsParameter2.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposListCollaboratorsParameter2.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ReposListCollaboratorsParameter2.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ReposListCollaboratorsParameter2.values) {
        expect(
          ReposListCollaboratorsParameter2.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
