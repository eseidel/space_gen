// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsListAttestationsBulkRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgsListAttestationsBulkRequest(
        subjectDigests: const <String>['example'],
      );
      final parsed = OrgsListAttestationsBulkRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsListAttestationsBulkRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            OrgsListAttestationsBulkRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
