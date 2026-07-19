// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SeparatorComponentResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SeparatorComponentResponse(
        id: 0,
        spacing: MessageComponentSeparatorSpacingSize.small,
        divider: false,
      );
      final parsed = SeparatorComponentResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SeparatorComponentResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SeparatorComponentResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
