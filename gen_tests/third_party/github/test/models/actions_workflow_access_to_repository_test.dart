// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsWorkflowAccessToRepository', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsWorkflowAccessToRepository(
        accessLevel: ActionsWorkflowAccessToRepositoryAccessLevel.none,
      );
      final parsed = ActionsWorkflowAccessToRepository.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsWorkflowAccessToRepository.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsWorkflowAccessToRepository.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
