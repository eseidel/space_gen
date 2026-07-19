// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ConnectedAccountProviders', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ConnectedAccountProviders.battlenet;
      final parsed = ConnectedAccountProviders.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ConnectedAccountProviders.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ConnectedAccountProviders.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ConnectedAccountProviders.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ConnectedAccountProviders.values) {
        expect(
          ConnectedAccountProviders.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
