// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssuesAddLabelsRequestOneOf3Inner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssuesAddLabelsRequestOneOf3Inner(name: 'example');
      final parsed = IssuesAddLabelsRequestOneOf3Inner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssuesAddLabelsRequestOneOf3Inner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssuesAddLabelsRequestOneOf3Inner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
