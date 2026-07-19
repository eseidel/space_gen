// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCreateOrgVariableRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCreateOrgVariableRequest(
        name: 'example',
        value: 'example',
        visibility: ActionsCreateOrgVariableRequestVisibility.all,
      );
      final parsed = ActionsCreateOrgVariableRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCreateOrgVariableRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ActionsCreateOrgVariableRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
