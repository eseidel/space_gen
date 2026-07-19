// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsRunnerLabelsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsRunnerLabelsResponse(
        totalCount: 0,
        labels: <RunnerLabel>[RunnerLabel(name: 'example')],
      );
      final parsed = ActionsRunnerLabelsResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsRunnerLabelsResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsRunnerLabelsResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
