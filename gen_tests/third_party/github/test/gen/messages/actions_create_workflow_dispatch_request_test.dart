// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateWorkflowDispatchRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsCreateWorkflowDispatchRequest(ref: 'example');
      final parsed = ActionsCreateWorkflowDispatchRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCreateWorkflowDispatchRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCreateWorkflowDispatchRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
