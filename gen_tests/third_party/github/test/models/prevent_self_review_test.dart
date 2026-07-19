// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PreventSelfReview', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PreventSelfReview(false);
      final parsed = PreventSelfReview.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PreventSelfReview.maybeFromJson(null), isNull);
    });
  });
}
