// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineCrossReferencedEventSource', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TimelineCrossReferencedEventSource();
      final parsed = TimelineCrossReferencedEventSource.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineCrossReferencedEventSource.maybeFromJson(null), isNull);
    });
  });
}
