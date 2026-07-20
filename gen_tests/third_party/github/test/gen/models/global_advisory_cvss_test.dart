// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GlobalAdvisoryCvss', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GlobalAdvisoryCvss(vectorString: 'example', score: 0);
      final parsed = GlobalAdvisoryCvss.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GlobalAdvisoryCvss.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GlobalAdvisoryCvss.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
