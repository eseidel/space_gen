// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitActivity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CommitActivity(
        days: <int>[0],
        total: 89,
        week: 1336280400,
      );
      final parsed = CommitActivity.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitActivity.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommitActivity.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
