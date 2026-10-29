// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubCheckRunOutput', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubCheckRunOutput();
      final parsed = GithubCheckRunOutput.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubCheckRunOutput.maybeFromJson(null), isNull);
    });
  });
}
