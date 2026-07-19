// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateChannelRequest', () {
    test('UpdateDmRequestPartial round-trips via maybeFromJson/toJson', () {
      const instance = UpdateDmRequestPartial();
      final parsed = UpdateDmRequestPartial.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'UpdateGroupDmRequestPartial round-trips via maybeFromJson/toJson',
      () {
        const instance = UpdateGroupDmRequestPartial();
        final parsed = UpdateGroupDmRequestPartial.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'UpdateGuildChannelRequestPartial round-trips via maybeFromJson/toJson',
      () {
        const instance = UpdateGuildChannelRequestPartial();
        final parsed = UpdateGuildChannelRequestPartial.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('UpdateThreadRequestPartial round-trips via maybeFromJson/toJson', () {
      const instance = UpdateThreadRequestPartial();
      final parsed = UpdateThreadRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateChannelRequest.maybeFromJson(null), isNull);
    });
  });
}
