// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('FileCommitCommitParentsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = FileCommitCommitParentsInner();
      final parsed = FileCommitCommitParentsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FileCommitCommitParentsInner.maybeFromJson(null), isNull);
    });
  });
}
