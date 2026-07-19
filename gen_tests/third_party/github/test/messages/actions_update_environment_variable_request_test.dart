// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsUpdateEnvironmentVariableRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsUpdateEnvironmentVariableRequest();
      final parsed = ActionsUpdateEnvironmentVariableRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsUpdateEnvironmentVariableRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
