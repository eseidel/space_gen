// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TargetUsersJobStatusResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TargetUsersJobStatusResponse(
        status: TargetUsersJobStatusTypes.unspecified,
        totalUsers: UInt32Type(0),
        processedUsers: UInt32Type(0),
        createdAt: DateTime.utc(2024),
        completedAt: DateTime.utc(2024),
        errorMessage: 'example',
      );
      final parsed = TargetUsersJobStatusResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TargetUsersJobStatusResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TargetUsersJobStatusResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
