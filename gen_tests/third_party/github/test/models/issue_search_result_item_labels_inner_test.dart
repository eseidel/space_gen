// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueSearchResultItemLabelsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssueSearchResultItemLabelsInner();
      final parsed = IssueSearchResultItemLabelsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueSearchResultItemLabelsInner.maybeFromJson(null), isNull);
    });
  });
}
