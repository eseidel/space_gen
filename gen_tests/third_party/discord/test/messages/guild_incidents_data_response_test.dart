// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildIncidentsDataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildIncidentsDataResponse(
        invitesDisabledUntil: DateTime.utc(2024),
        dmsDisabledUntil: DateTime.utc(2024),
      );
      final parsed = GuildIncidentsDataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildIncidentsDataResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildIncidentsDataResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
