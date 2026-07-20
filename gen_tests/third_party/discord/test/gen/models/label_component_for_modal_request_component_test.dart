// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('LabelComponentForModalRequestComponent', () {
    test(
      'ChannelSelectComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = ChannelSelectComponentForModalRequest(
          customId: 'example',
        );
        final parsed = ChannelSelectComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'CheckboxComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = CheckboxComponentForModalRequest(customId: 'example');
        final parsed = CheckboxComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'CheckboxGroupComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = CheckboxGroupComponentForModalRequest(
          customId: 'example',
          options: <CheckboxGroupOptionForRequest>[
            CheckboxGroupOptionForRequest(label: 'example', value: 'example'),
          ],
        );
        final parsed = CheckboxGroupComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'FileUploadComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = FileUploadComponentForModalRequest(
          customId: 'example',
        );
        final parsed = FileUploadComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'MentionableSelectComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = MentionableSelectComponentForModalRequest(
          customId: 'example',
        );
        final parsed = MentionableSelectComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RadioGroupComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = RadioGroupComponentForModalRequest(
          customId: 'example',
          options: <RadioGroupOptionForRequest>[
            RadioGroupOptionForRequest(label: 'example', value: 'example'),
            RadioGroupOptionForRequest(label: 'example', value: 'example'),
          ],
        );
        final parsed = RadioGroupComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RoleSelectComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = RoleSelectComponentForModalRequest(
          customId: 'example',
        );
        final parsed = RoleSelectComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'StringSelectComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = StringSelectComponentForModalRequest(
          customId: 'example',
          options: <StringSelectOptionForRequest>[
            StringSelectOptionForRequest(label: 'example', value: 'example'),
          ],
        );
        final parsed = StringSelectComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'UserSelectComponentForModalRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = UserSelectComponentForModalRequest(
          customId: 'example',
        );
        final parsed = UserSelectComponentForModalRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(
        LabelComponentForModalRequestComponent.maybeFromJson(null),
        isNull,
      );
    });
  });
}
