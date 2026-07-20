// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesAddLabelsRequest', () {
    test(
      'IssuesAddLabelsRequestOneOf0 round-trips via maybeFromJson/toJson',
      () {
        final instance = IssuesAddLabelsRequestOneOf0();
        final parsed = IssuesAddLabelsRequestOneOf0.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'IssuesAddLabelsRequestOneOf2 round-trips via maybeFromJson/toJson',
      () {
        final instance = IssuesAddLabelsRequestOneOf2();
        final parsed = IssuesAddLabelsRequestOneOf2.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(IssuesAddLabelsRequest.maybeFromJson(null), isNull);
    });
  });
}
