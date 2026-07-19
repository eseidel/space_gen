// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChecksCreateRequestOneOf0ActionsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ChecksCreateRequestOneOf0ActionsInner(
        label: 'example',
        description: 'example',
        identifier: 'example',
      );
      final parsed = ChecksCreateRequestOneOf0ActionsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChecksCreateRequestOneOf0ActionsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChecksCreateRequestOneOf0ActionsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
