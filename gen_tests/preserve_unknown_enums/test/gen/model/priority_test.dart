// GENERATED — do not hand-edit.
import 'package:preserve_unknown_enums/api.dart';
import 'package:test/test.dart';

void main() {
  group('Priority', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Priority(1);
      final parsed = Priority.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Priority.maybeFromJson(null), isNull);
    });

    test('fromJson round-trips unknown values via raw', () {
      final parsed = Priority.fromJson(-1);
      expect(parsed.toJson(), equals(-1));
    });
  });
}
