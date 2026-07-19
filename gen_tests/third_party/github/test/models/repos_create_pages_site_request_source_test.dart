// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreatePagesSiteRequestSource', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreatePagesSiteRequestSource(branch: 'example');
      final parsed = ReposCreatePagesSiteRequestSource.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreatePagesSiteRequestSource.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreatePagesSiteRequestSource.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
