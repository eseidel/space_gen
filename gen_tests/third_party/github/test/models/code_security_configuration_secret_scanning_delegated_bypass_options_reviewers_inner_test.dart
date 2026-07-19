// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group(
    'CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewersInner',
    () {
      test('round-trips via maybeFromJson/toJson', () {
        const instance =
            CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewersInner(
              reviewerId: 0,
              reviewerType:
                  CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewersInnerReviewerType
                      .team,
            );
        final parsed =
            CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewersInner.maybeFromJson(
              instance.toJson(),
            )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      });

      test('maybeFromJson returns null on null input', () {
        expect(
          CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewersInner.maybeFromJson(
            null,
          ),
          isNull,
        );
      });

      test('maybeFromJson throws FormatException on invalid input', () {
        expect(
          () =>
              CodeSecurityConfigurationSecretScanningDelegatedBypassOptionsReviewersInner.maybeFromJson(
                <String, dynamic>{},
              ),
          throwsFormatException,
        );
      });
    },
  );
}
