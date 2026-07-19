// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SnapshotJob', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SnapshotJob(
        id: '5622a2b0-63f6-4732-8c34-a1ab27e102a11',
        correlator: 'yourworkflowname_yourjobname',
      );
      final parsed = SnapshotJob.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SnapshotJob.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SnapshotJob.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
