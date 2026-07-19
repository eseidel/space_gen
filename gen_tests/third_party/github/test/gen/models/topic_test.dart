// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Topic', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Topic(names: <String>['example']);
      final parsed = Topic.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Topic.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Topic.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
