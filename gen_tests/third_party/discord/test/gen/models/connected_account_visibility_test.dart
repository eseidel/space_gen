// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ConnectedAccountVisibility', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ConnectedAccountVisibility.none;
      final parsed = ConnectedAccountVisibility.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ConnectedAccountVisibility.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ConnectedAccountVisibility.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ConnectedAccountVisibility.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ConnectedAccountVisibility.values) {
        expect(
          ConnectedAccountVisibility.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
