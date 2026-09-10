// GENERATED — do not hand-edit.
import 'package:preserve_unknown_enums/api.dart';
import 'package:test/test.dart';

void main() {
  group('Item', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Item(status: Status.open, priority: const Priority(1));
      final parsed = Item.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Item.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Item.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
