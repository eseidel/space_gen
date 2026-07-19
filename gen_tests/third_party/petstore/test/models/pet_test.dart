// GENERATED — do not hand-edit.
import 'package:petstore/api.dart';
import 'package:test/test.dart';

void main() {
  group('Pet', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Pet(name: 'doggie', photoUrls: <String>['example']);
      final parsed = Pet.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Pet.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Pet.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
