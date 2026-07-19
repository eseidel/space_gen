// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ClassroomAssignmentGrade', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ClassroomAssignmentGrade(
        assignmentName: 'example',
        assignmentUrl: 'example',
        starterCodeUrl: 'example',
        githubUsername: 'example',
        rosterIdentifier: 'example',
        studentRepositoryName: 'example',
        studentRepositoryUrl: 'example',
        submissionTimestamp: 'example',
        pointsAwarded: 0,
        pointsAvailable: 0,
      );
      final parsed = ClassroomAssignmentGrade.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ClassroomAssignmentGrade.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ClassroomAssignmentGrade.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
