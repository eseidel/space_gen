// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchBlockCreations', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProtectedBranchBlockCreations(enabled: false);
      final parsed = ProtectedBranchBlockCreations.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchBlockCreations.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchBlockCreations.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
