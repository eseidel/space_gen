// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateApplicationUserRoleConnectionRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UpdateApplicationUserRoleConnectionRequest();
      final parsed = UpdateApplicationUserRoleConnectionRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UpdateApplicationUserRoleConnectionRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
