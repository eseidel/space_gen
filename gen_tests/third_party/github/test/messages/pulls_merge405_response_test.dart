// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsMerge405Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsMerge405Response();
      final parsed = PullsMerge405Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsMerge405Response.maybeFromJson(null), isNull);
    });
  });
}
