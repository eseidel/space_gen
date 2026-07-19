// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('KeywordTriggerMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = KeywordTriggerMetadataResponse(
        keywordFilter: <String>['example'],
        regexPatterns: <String>['example'],
        allowList: <String>['example'],
      );
      final parsed = KeywordTriggerMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(KeywordTriggerMetadataResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => KeywordTriggerMetadataResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
