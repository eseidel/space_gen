// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf0Output', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChecksCreateRequestOneOf0Output(
        title: 'example',
        summary: 'example',
      );
      final parsed = ChecksCreateRequestOneOf0Output.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksCreateRequestOneOf0Output.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ChecksCreateRequestOneOf0Output.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
