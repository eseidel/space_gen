// GENERATED — do not hand-edit.
import 'package:security/api.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = User(id: 'example');
      final parsed = User.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(User.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => User.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
