// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateBranchProtectionRequestRequiredStatusChecks', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateBranchProtectionRequestRequiredStatusChecks(
        strict: false,
        contexts: <String>['example'],
      );
      final parsed =
          ReposUpdateBranchProtectionRequestRequiredStatusChecks.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposUpdateBranchProtectionRequestRequiredStatusChecks.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ReposUpdateBranchProtectionRequestRequiredStatusChecks.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
