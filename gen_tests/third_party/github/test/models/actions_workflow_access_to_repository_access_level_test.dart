// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsWorkflowAccessToRepositoryAccessLevel', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsWorkflowAccessToRepositoryAccessLevel.none;
      final parsed = ActionsWorkflowAccessToRepositoryAccessLevel.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsWorkflowAccessToRepositoryAccessLevel.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsWorkflowAccessToRepositoryAccessLevel.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ActionsWorkflowAccessToRepositoryAccessLevel.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ActionsWorkflowAccessToRepositoryAccessLevel.values) {
        expect(
          ActionsWorkflowAccessToRepositoryAccessLevel.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
