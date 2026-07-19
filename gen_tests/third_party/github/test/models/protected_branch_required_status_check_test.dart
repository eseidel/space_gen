// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchRequiredStatusCheck', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProtectedBranchRequiredStatusCheck(
        contexts: <String>['example'],
        checks: <ProtectedBranchRequiredStatusCheckChecksInner>[
          ProtectedBranchRequiredStatusCheckChecksInner(
            context: 'example',
            appId: 0,
          ),
        ],
      );
      final parsed = ProtectedBranchRequiredStatusCheck.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchRequiredStatusCheck.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchRequiredStatusCheck.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
