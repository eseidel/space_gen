// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetMember', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WidgetMember(
        id: 'example',
        username: 'example',
        discriminator: WidgetUserDiscriminator.zeroes,
        avatar: const <String, dynamic>{},
        status: 'example',
        avatarUrl: Uri.parse('https://example.com'),
      );
      final parsed = WidgetMember.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WidgetMember.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WidgetMember.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
