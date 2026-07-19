// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SnapshotDetector', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SnapshotDetector(
        name: 'docker buildtime detector',
        version: '1.0.0',
        url: 'http://example.com/docker-buildtimer-detector',
      );
      final parsed = SnapshotDetector.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SnapshotDetector.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SnapshotDetector.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
