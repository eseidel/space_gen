// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineCrossReferencedEvent', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TimelineCrossReferencedEvent(
        event: 'example',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        source: const TimelineCrossReferencedEventSource(),
      );
      final parsed = TimelineCrossReferencedEvent.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineCrossReferencedEvent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TimelineCrossReferencedEvent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
