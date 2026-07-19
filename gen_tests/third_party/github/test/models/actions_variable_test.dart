// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsVariable', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsVariable(
        name: 'USERNAME',
        value: 'octocat',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = ActionsVariable.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsVariable.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsVariable.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
