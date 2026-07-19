// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectsMoveCard403ResponseErrorsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProjectsMoveCard403ResponseErrorsInner();
      final parsed = ProjectsMoveCard403ResponseErrorsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ProjectsMoveCard403ResponseErrorsInner.maybeFromJson(null),
        isNull,
      );
    });
  });
}
