// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesSetLabelsRequestOneOf3Inner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesSetLabelsRequestOneOf3Inner(name: 'example');
      final parsed = IssuesSetLabelsRequestOneOf3Inner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesSetLabelsRequestOneOf3Inner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssuesSetLabelsRequestOneOf3Inner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
