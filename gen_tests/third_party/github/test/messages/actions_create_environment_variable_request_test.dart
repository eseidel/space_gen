// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateEnvironmentVariableRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCreateEnvironmentVariableRequest(
        name: 'example',
        value: 'example',
      );
      final parsed = ActionsCreateEnvironmentVariableRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsCreateEnvironmentVariableRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCreateEnvironmentVariableRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
