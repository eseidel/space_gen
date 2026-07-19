// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ThreadMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ThreadMetadataResponse(
        archived: false,
        archiveTimestamp: DateTime.utc(2024),
        autoArchiveDuration: ThreadAutoArchiveDuration.oneHour,
        locked: false,
      );
      final parsed = ThreadMetadataResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ThreadMetadataResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ThreadMetadataResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
