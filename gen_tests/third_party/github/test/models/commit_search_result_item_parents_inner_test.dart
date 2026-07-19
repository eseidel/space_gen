// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitSearchResultItemParentsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CommitSearchResultItemParentsInner();
      final parsed = CommitSearchResultItemParentsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitSearchResultItemParentsInner.maybeFromJson(null), isNull);
    });
  });
}
