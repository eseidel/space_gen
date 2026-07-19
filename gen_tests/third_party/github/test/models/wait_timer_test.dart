// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WaitTimer', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WaitTimer(30);
      final parsed = WaitTimer.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WaitTimer.maybeFromJson(null), isNull);
    });
  });
}
