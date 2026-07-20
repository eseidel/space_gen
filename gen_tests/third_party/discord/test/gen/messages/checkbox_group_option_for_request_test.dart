// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckboxGroupOptionForRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CheckboxGroupOptionForRequest(
        label: 'example',
        value: 'example',
      );
      final parsed = CheckboxGroupOptionForRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CheckboxGroupOptionForRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CheckboxGroupOptionForRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
