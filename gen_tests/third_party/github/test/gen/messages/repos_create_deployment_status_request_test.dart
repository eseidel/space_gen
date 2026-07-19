// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateDeploymentStatusRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateDeploymentStatusRequest(
        state: ReposCreateDeploymentStatusRequestState.error,
      );
      final parsed = ReposCreateDeploymentStatusRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateDeploymentStatusRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateDeploymentStatusRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
