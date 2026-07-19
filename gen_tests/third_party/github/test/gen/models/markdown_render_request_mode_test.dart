// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MarkdownRenderRequestMode', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MarkdownRenderRequestMode.markdown;
      final parsed = MarkdownRenderRequestMode.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MarkdownRenderRequestMode.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MarkdownRenderRequestMode.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MarkdownRenderRequestMode.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MarkdownRenderRequestMode.values) {
        expect(
          MarkdownRenderRequestMode.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
