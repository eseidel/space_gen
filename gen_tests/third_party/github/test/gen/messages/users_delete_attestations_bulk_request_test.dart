// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('UsersDeleteAttestationsBulkRequest', () {
    test(
      'UsersDeleteAttestationsBulkRequestOneOf0 round-trips via maybeFromJson/toJson',
      () {
        const instance = UsersDeleteAttestationsBulkRequestOneOf0(
          subjectDigests: <String>['example'],
        );
        final parsed = UsersDeleteAttestationsBulkRequestOneOf0.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'UsersDeleteAttestationsBulkRequestOneOf1 round-trips via maybeFromJson/toJson',
      () {
        const instance = UsersDeleteAttestationsBulkRequestOneOf1(
          attestationIds: <int>[0],
        );
        final parsed = UsersDeleteAttestationsBulkRequestOneOf1.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(UsersDeleteAttestationsBulkRequest.maybeFromJson(null), isNull);
    });
  });
}
