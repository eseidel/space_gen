// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetStatus200ResponseAnnouncementsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetStatus200ResponseAnnouncementsInner(
        title: 'example',
        body: 'example',
      );
      final parsed = GetStatus200ResponseAnnouncementsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        GetStatus200ResponseAnnouncementsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetStatus200ResponseAnnouncementsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
