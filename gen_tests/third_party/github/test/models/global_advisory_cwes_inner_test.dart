// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GlobalAdvisoryCwesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GlobalAdvisoryCwesInner(
        cweId: 'example',
        name: 'example',
      );
      final parsed = GlobalAdvisoryCwesInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GlobalAdvisoryCwesInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GlobalAdvisoryCwesInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
