// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesSetLabelsRequestOneOf2LabelsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesSetLabelsRequestOneOf2LabelsInner(name: 'example');
      final parsed = IssuesSetLabelsRequestOneOf2LabelsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        IssuesSetLabelsRequestOneOf2LabelsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssuesSetLabelsRequestOneOf2LabelsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
