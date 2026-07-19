// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsReviewPendingDeploymentsForRunRequestState', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          ActionsReviewPendingDeploymentsForRunRequestState.approved;
      final parsed =
          ActionsReviewPendingDeploymentsForRunRequestState.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsReviewPendingDeploymentsForRunRequestState.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsReviewPendingDeploymentsForRunRequestState.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ActionsReviewPendingDeploymentsForRunRequestState.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ActionsReviewPendingDeploymentsForRunRequestState.values) {
        expect(
          ActionsReviewPendingDeploymentsForRunRequestState.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
