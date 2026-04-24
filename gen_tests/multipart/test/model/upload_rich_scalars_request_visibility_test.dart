// GENERATED — do not hand-edit.
import 'package:multipart/api.dart';
import 'package:test/test.dart';

void main() {
  group('UploadRichScalarsRequestVisibility', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UploadRichScalarsRequestVisibility.values.first;
      final parsed = UploadRichScalarsRequestVisibility.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UploadRichScalarsRequestVisibility.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UploadRichScalarsRequestVisibility.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in UploadRichScalarsRequestVisibility.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in UploadRichScalarsRequestVisibility.values) {
        expect(
          UploadRichScalarsRequestVisibility.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
