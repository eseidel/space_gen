// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('EventRepo', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = EventRepo(
        id: 0,
        name: 'example',
        url: Uri.parse('https://example.com'),
      );
      final parsed = EventRepo.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EventRepo.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EventRepo.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
