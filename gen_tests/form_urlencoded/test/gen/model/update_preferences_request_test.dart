// GENERATED — do not hand-edit.
import 'package:form_urlencoded/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdatePreferencesRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UpdatePreferencesRequest(
        visibility: UpdatePreferencesRequestVisibility.public,
      );
      final parsed = UpdatePreferencesRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdatePreferencesRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UpdatePreferencesRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
