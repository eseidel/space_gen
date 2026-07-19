// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsRunnerLabelsReadonlyResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsRunnerLabelsReadonlyResponse(
        totalCount: 0,
        labels: <RunnerLabel>[RunnerLabel(name: 'example')],
      );
      final parsed = ActionsRunnerLabelsReadonlyResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsRunnerLabelsReadonlyResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsRunnerLabelsReadonlyResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
