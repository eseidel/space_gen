// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotOrganizationDetails', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotOrganizationDetails(
        seatBreakdown: CopilotOrganizationSeatBreakdown(),
        publicCodeSuggestions:
            CopilotOrganizationDetailsPublicCodeSuggestions.allow,
        seatManagementSetting:
            CopilotOrganizationDetailsSeatManagementSetting.assignAll,
        entries: <String, dynamic>{},
      );
      final parsed = CopilotOrganizationDetails.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotOrganizationDetails.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CopilotOrganizationDetails.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
