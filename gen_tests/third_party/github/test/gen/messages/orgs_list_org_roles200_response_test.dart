// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListOrgRoles200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsListOrgRoles200Response();
      final parsed = OrgsListOrgRoles200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsListOrgRoles200Response.maybeFromJson(null), isNull);
    });
  });
}
