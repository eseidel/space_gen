// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateOrUpdateThreadTagRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateOrUpdateThreadTagRequest(name: 'example');
      final parsed = CreateOrUpdateThreadTagRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateOrUpdateThreadTagRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateOrUpdateThreadTagRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
