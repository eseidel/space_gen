// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesSetLabelsRequest', () {
    test(
      'IssuesSetLabelsRequestOneOf0 round-trips via maybeFromJson/toJson',
      () {
        const instance = IssuesSetLabelsRequestOneOf0();
        final parsed = IssuesSetLabelsRequestOneOf0.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'IssuesSetLabelsRequestOneOf2 round-trips via maybeFromJson/toJson',
      () {
        const instance = IssuesSetLabelsRequestOneOf2();
        final parsed = IssuesSetLabelsRequestOneOf2.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(IssuesSetLabelsRequest.maybeFromJson(null), isNull);
    });
  });
}
