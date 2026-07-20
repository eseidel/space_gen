// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf1ActionsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChecksCreateRequestOneOf1ActionsInner(
        label: 'example',
        description: 'example',
        identifier: 'example',
      );
      final parsed = ChecksCreateRequestOneOf1ActionsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksCreateRequestOneOf1ActionsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksCreateRequestOneOf1ActionsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
