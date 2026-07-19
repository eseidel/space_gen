// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposDelete403Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposDelete403Response();
      final parsed = ReposDelete403Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposDelete403Response.maybeFromJson(null), isNull);
    });
  });
}
