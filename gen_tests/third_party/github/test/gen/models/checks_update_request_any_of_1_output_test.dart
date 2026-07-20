// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksUpdateRequestAnyOf1Output', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChecksUpdateRequestAnyOf1Output(summary: 'example');
      final parsed = ChecksUpdateRequestAnyOf1Output.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksUpdateRequestAnyOf1Output.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ChecksUpdateRequestAnyOf1Output.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
