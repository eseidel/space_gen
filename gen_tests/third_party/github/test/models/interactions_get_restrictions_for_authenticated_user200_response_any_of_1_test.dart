// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1();
      final parsed =
          InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1.maybeFromJson(
          null,
        ),
        isNull,
      );
    });
  });
}
