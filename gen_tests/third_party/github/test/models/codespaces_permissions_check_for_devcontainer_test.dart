// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesPermissionsCheckForDevcontainer', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespacesPermissionsCheckForDevcontainer(
        accepted: false,
      );
      final parsed = CodespacesPermissionsCheckForDevcontainer.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespacesPermissionsCheckForDevcontainer.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesPermissionsCheckForDevcontainer.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
