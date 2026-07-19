// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationRoleConnectionsMetadataItemRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationRoleConnectionsMetadataItemRequest(
        type: MetadataItemTypes.integerLessThanEqual,
        key: 'example',
        name: 'example',
        description: 'example',
      );
      final parsed =
          ApplicationRoleConnectionsMetadataItemRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationRoleConnectionsMetadataItemRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationRoleConnectionsMetadataItemRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
