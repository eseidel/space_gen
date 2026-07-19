// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionsGetRestrictionsForOrg200ResponseAnyOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InteractionsGetRestrictionsForOrg200ResponseAnyOf1();
      final parsed =
          InteractionsGetRestrictionsForOrg200ResponseAnyOf1.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        InteractionsGetRestrictionsForOrg200ResponseAnyOf1.maybeFromJson(null),
        isNull,
      );
    });
  });
}
