// GENERATED — do not hand-edit.
import 'package:null_type_property/api.dart';
import 'package:test/test.dart';

void main() {
  group('Thing', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Thing(id: 'example');
      final parsed = Thing.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Thing.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Thing.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
