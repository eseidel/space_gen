// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionRowComponentResponseComponentsInner', () {
    test(
      'ChannelSelectComponentResponse round-trips via maybeFromJson/toJson',
      () {
        const instance = ChannelSelectComponentResponse(
          id: 0,
          customId: 'example',
          minValues: 0,
          maxValues: 0,
        );
        final parsed = ChannelSelectComponentResponse.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'MentionableSelectComponentResponse round-trips via maybeFromJson/toJson',
      () {
        const instance = MentionableSelectComponentResponse(
          id: 0,
          customId: 'example',
          minValues: 0,
          maxValues: 0,
        );
        final parsed = MentionableSelectComponentResponse.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RoleSelectComponentResponse round-trips via maybeFromJson/toJson',
      () {
        const instance = RoleSelectComponentResponse(
          id: 0,
          customId: 'example',
          minValues: 0,
          maxValues: 0,
        );
        final parsed = RoleSelectComponentResponse.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'StringSelectComponentResponse round-trips via maybeFromJson/toJson',
      () {
        const instance = StringSelectComponentResponse(
          id: 0,
          customId: 'example',
          minValues: 0,
          maxValues: 0,
          options: <StringSelectOptionResponse>[
            StringSelectOptionResponse(label: 'example', value: 'example'),
          ],
        );
        final parsed = StringSelectComponentResponse.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('TextInputComponentResponse round-trips via maybeFromJson/toJson', () {
      const instance = TextInputComponentResponse(
        id: 0,
        customId: 'example',
        style: TextInputStyleTypes.short,
        label: 'example',
        minLength: 0,
        maxLength: 0,
      );
      final parsed = TextInputComponentResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'UserSelectComponentResponse round-trips via maybeFromJson/toJson',
      () {
        const instance = UserSelectComponentResponse(
          id: 0,
          customId: 'example',
          minValues: 0,
          maxValues: 0,
        );
        final parsed = UserSelectComponentResponse.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionRowComponentResponseComponentsInner.maybeFromJson(null),
        isNull,
      );
    });
  });
}
