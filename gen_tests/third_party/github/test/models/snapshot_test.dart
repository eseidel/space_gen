// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Snapshot', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Snapshot(
        version: 0,
        job: const SnapshotJob(
          id: '5622a2b0-63f6-4732-8c34-a1ab27e102a11',
          correlator: 'yourworkflowname_yourjobname',
        ),
        sha: 'ddc951f4b1293222421f2c8df679786153acf689',
        ref: 'refs/heads/main',
        detector: const SnapshotDetector(
          name: 'docker buildtime detector',
          version: '1.0.0',
          url: 'http://example.com/docker-buildtimer-detector',
        ),
        scanned: DateTime.utc(2024),
      );
      final parsed = Snapshot.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Snapshot.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Snapshot.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
