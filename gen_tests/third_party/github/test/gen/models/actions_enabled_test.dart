// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsEnabled', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsEnabled(false);
      final parsed = ActionsEnabled.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsEnabled.maybeFromJson(null), isNull);
    });
  });
}
