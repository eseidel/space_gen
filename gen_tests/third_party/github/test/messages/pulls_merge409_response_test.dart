// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsMerge409Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsMerge409Response();
      final parsed = PullsMerge409Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsMerge409Response.maybeFromJson(null), isNull);
    });
  });
}
