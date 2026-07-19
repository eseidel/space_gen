// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueLabelsInner', () {
    test('IssueLabelsInnerOneOf1 round-trips via maybeFromJson/toJson', () {
      const instance = IssueLabelsInnerOneOf1();
      final parsed = IssueLabelsInnerOneOf1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueLabelsInner.maybeFromJson(null), isNull);
    });
  });
}
