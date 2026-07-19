// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesUpdateForAuthenticatedUserRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesUpdateForAuthenticatedUserRequest();
      final parsed = CodespacesUpdateForAuthenticatedUserRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesUpdateForAuthenticatedUserRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
