// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubCheckRunOutput1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GithubCheckRunOutput1();
      final parsed = GithubCheckRunOutput1.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubCheckRunOutput1.maybeFromJson(null), isNull);
    });
  });
}
