// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesLockRequestLockReason', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesLockRequestLockReason.offTopic;
      final parsed = IssuesLockRequestLockReason.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesLockRequestLockReason.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            IssuesLockRequestLockReason.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in IssuesLockRequestLockReason.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in IssuesLockRequestLockReason.values) {
        expect(
          IssuesLockRequestLockReason.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
