// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AddGroupDmUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AddGroupDmUserRequest();
      final parsed = AddGroupDmUserRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AddGroupDmUserRequest.maybeFromJson(null), isNull);
    });
  });
}
