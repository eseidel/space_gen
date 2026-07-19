// GENERATED — do not hand-edit.
import 'package:petstore/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApiResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApiResponse();
      final parsed = ApiResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApiResponse.maybeFromJson(null), isNull);
    });
  });
}
