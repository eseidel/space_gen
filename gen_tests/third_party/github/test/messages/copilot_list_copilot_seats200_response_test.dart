// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotListCopilotSeats200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotListCopilotSeats200Response();
      final parsed = CopilotListCopilotSeats200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotListCopilotSeats200Response.maybeFromJson(null), isNull);
    });
  });
}
