// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCreateTreeRequestTreeInnerMode', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitCreateTreeRequestTreeInnerMode.n100644;
      final parsed = GitCreateTreeRequestTreeInnerMode.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCreateTreeRequestTreeInnerMode.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCreateTreeRequestTreeInnerMode.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in GitCreateTreeRequestTreeInnerMode.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in GitCreateTreeRequestTreeInnerMode.values) {
        expect(
          GitCreateTreeRequestTreeInnerMode.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
