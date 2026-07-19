// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotUpdateAlertRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotUpdateAlertRequest(
        state: DependabotUpdateAlertRequestState.dismissed,
      );
      final parsed = DependabotUpdateAlertRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotUpdateAlertRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotUpdateAlertRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
