// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PageBuildError', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PageBuildError(message: 'example');
      final parsed = PageBuildError.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PageBuildError.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PageBuildError.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
