// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleClassroom', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SimpleClassroom(
        id: 42,
        name: 'Programming Elixir',
        archived: false,
        url: 'https://classroom.github.com/classrooms/1-programming-elixir',
      );
      final parsed = SimpleClassroom.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleClassroom.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleClassroom.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
