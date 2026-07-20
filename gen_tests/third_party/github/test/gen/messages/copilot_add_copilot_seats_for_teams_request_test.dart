// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotAddCopilotSeatsForTeamsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CopilotAddCopilotSeatsForTeamsRequest(
        selectedTeams: const <String>['example'],
      );
      final parsed = CopilotAddCopilotSeatsForTeamsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotAddCopilotSeatsForTeamsRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotAddCopilotSeatsForTeamsRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
