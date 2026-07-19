// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReferencedWorkflow', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReferencedWorkflow(path: 'example', sha: 'example');
      final parsed = ReferencedWorkflow.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReferencedWorkflow.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReferencedWorkflow.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
