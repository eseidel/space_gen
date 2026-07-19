// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionRowComponentForMessageRequestComponentsInner', () {
    test(
      'ChannelSelectComponentForMessageRequest round-trips via maybeFromJson/toJson',
      () {
        const instance = ChannelSelectComponentForMessageRequest(
          customId: 'example',
        );
        final parsed = ChannelSelectComponentForMessageRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'MentionableSelectComponentForMessageRequest round-trips via maybeFromJson/toJson',
      () {
        const instance = MentionableSelectComponentForMessageRequest(
          customId: 'example',
        );
        final parsed =
            MentionableSelectComponentForMessageRequest.maybeFromJson(
              instance.toJson(),
            )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RoleSelectComponentForMessageRequest round-trips via maybeFromJson/toJson',
      () {
        const instance = RoleSelectComponentForMessageRequest(
          customId: 'example',
        );
        final parsed = RoleSelectComponentForMessageRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'StringSelectComponentForMessageRequest round-trips via maybeFromJson/toJson',
      () {
        const instance = StringSelectComponentForMessageRequest(
          customId: 'example',
          options: <StringSelectOptionForRequest>[
            StringSelectOptionForRequest(label: 'example', value: 'example'),
          ],
        );
        final parsed = StringSelectComponentForMessageRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'UserSelectComponentForMessageRequest round-trips via maybeFromJson/toJson',
      () {
        const instance = UserSelectComponentForMessageRequest(
          customId: 'example',
        );
        final parsed = UserSelectComponentForMessageRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionRowComponentForMessageRequestComponentsInner.maybeFromJson(null),
        isNull,
      );
    });
  });
}
