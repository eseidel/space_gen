// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetActivity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WidgetActivity(name: 'example');
      final parsed = WidgetActivity.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WidgetActivity.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WidgetActivity.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
