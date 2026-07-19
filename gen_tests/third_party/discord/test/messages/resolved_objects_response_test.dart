// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ResolvedObjectsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ResolvedObjectsResponse();
      final parsed = ResolvedObjectsResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ResolvedObjectsResponse.maybeFromJson(null), isNull);
    });
  });
}
