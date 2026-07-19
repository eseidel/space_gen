// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CopilotDotcomPullRequests', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CopilotDotcomPullRequests(entries: <String, dynamic>{});
      final parsed = CopilotDotcomPullRequests.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CopilotDotcomPullRequests.maybeFromJson(null), isNull);
    });
  });
}
