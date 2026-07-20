// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespacesSetCodespacesAccessRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodespacesSetCodespacesAccessRequest(
        visibility: CodespacesSetCodespacesAccessRequestVisibility.disabled,
      );
      final parsed = CodespacesSetCodespacesAccessRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodespacesSetCodespacesAccessRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodespacesSetCodespacesAccessRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
