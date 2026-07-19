// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsUpdateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsUpdateRequest();
      final parsed = PullsUpdateRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsUpdateRequest.maybeFromJson(null), isNull);
    });
  });
}
