// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreatePagesDeploymentRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreatePagesDeploymentRequest(
        pagesBuildVersion: 'example',
        oidcToken: 'example',
      );
      final parsed = ReposCreatePagesDeploymentRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreatePagesDeploymentRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreatePagesDeploymentRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
