// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationCommandUpdateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationCommandUpdateRequest(name: 'example');
      final parsed = ApplicationCommandUpdateRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationCommandUpdateRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ApplicationCommandUpdateRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
