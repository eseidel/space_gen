// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateCommitStatusRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateCommitStatusRequest(
        state: ReposCreateCommitStatusRequestState.error,
      );
      final parsed = ReposCreateCommitStatusRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateCommitStatusRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateCommitStatusRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
