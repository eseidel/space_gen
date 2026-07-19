// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationRoleConnectionsMetadataItemResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationRoleConnectionsMetadataItemResponse(
        type: MetadataItemTypes.integerLessThanEqual,
        key: 'example',
        name: 'example',
        description: 'example',
      );
      final parsed =
          ApplicationRoleConnectionsMetadataItemResponse.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationRoleConnectionsMetadataItemResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationRoleConnectionsMetadataItemResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
