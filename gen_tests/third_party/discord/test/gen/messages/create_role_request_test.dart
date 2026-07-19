// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateRoleRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateRoleRequest();
      final parsed = CreateRoleRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateRoleRequest.maybeFromJson(null), isNull);
    });
  });
}
