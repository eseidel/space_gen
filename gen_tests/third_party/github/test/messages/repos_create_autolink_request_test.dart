// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateAutolinkRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateAutolinkRequest(
        keyPrefix: 'example',
        urlTemplate: 'example',
      );
      final parsed = ReposCreateAutolinkRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateAutolinkRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposCreateAutolinkRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
