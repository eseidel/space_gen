// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('NewMemberActionType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = NewMemberActionType.view;
      final parsed = NewMemberActionType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(NewMemberActionType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => NewMemberActionType.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in NewMemberActionType.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in NewMemberActionType.values) {
        expect(NewMemberActionType.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
