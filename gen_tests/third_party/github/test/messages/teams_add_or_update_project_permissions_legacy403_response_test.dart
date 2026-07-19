// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsAddOrUpdateProjectPermissionsLegacy403Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsAddOrUpdateProjectPermissionsLegacy403Response();
      final parsed =
          TeamsAddOrUpdateProjectPermissionsLegacy403Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        TeamsAddOrUpdateProjectPermissionsLegacy403Response.maybeFromJson(null),
        isNull,
      );
    });
  });
}
