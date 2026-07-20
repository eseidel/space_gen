// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('RadioGroupOptionForRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RadioGroupOptionForRequest(
        label: 'example',
        value: 'example',
      );
      final parsed = RadioGroupOptionForRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RadioGroupOptionForRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RadioGroupOptionForRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
