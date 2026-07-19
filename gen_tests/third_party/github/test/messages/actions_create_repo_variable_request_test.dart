// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateRepoVariableRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCreateRepoVariableRequest(
        name: 'example',
        value: 'example',
      );
      final parsed = ActionsCreateRepoVariableRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCreateRepoVariableRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsCreateRepoVariableRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
