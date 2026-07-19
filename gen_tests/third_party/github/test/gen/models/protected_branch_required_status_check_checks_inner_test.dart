// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchRequiredStatusCheckChecksInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProtectedBranchRequiredStatusCheckChecksInner(
        context: 'example',
        appId: 0,
      );
      final parsed =
          ProtectedBranchRequiredStatusCheckChecksInner.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ProtectedBranchRequiredStatusCheckChecksInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchRequiredStatusCheckChecksInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
