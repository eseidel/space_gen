// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsConvertMemberToOutsideCollaborator202Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsConvertMemberToOutsideCollaborator202Response();
      final parsed =
          OrgsConvertMemberToOutsideCollaborator202Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsConvertMemberToOutsideCollaborator202Response.maybeFromJson(null),
        isNull,
      );
    });
  });
}
