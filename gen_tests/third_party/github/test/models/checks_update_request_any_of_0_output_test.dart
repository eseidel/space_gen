// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksUpdateRequestAnyOf0Output', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksUpdateRequestAnyOf0Output(summary: 'example');
      final parsed = ChecksUpdateRequestAnyOf0Output.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksUpdateRequestAnyOf0Output.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ChecksUpdateRequestAnyOf0Output.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
