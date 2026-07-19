// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadSubject', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ThreadSubject(
        title: 'example',
        url: 'example',
        latestCommentUrl: 'example',
        type: 'example',
      );
      final parsed = ThreadSubject.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadSubject.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadSubject.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
