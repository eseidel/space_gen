// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsAddOrUpdateProjectPermissionsInOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsAddOrUpdateProjectPermissionsInOrgRequest();
      final parsed =
          TeamsAddOrUpdateProjectPermissionsInOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        TeamsAddOrUpdateProjectPermissionsInOrgRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
