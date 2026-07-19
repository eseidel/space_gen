// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsRemoveOutsideCollaborator422Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsRemoveOutsideCollaborator422Response();
      final parsed = OrgsRemoveOutsideCollaborator422Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsRemoveOutsideCollaborator422Response.maybeFromJson(null),
        isNull,
      );
    });
  });
}
