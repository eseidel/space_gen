// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAndAnalysisDependabotSecurityUpdatesStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          SecurityAndAnalysisDependabotSecurityUpdatesStatus.enabled;
      final parsed =
          SecurityAndAnalysisDependabotSecurityUpdatesStatus.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecurityAndAnalysisDependabotSecurityUpdatesStatus.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecurityAndAnalysisDependabotSecurityUpdatesStatus.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in SecurityAndAnalysisDependabotSecurityUpdatesStatus.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in SecurityAndAnalysisDependabotSecurityUpdatesStatus.values) {
        expect(
          SecurityAndAnalysisDependabotSecurityUpdatesStatus.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
