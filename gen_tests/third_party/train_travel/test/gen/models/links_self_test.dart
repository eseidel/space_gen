// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:train_travel/api.dart';

void main() {
  group('LinksSelf', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LinksSelf();
      final parsed = LinksSelf.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LinksSelf.maybeFromJson(null), isNull);
    });
  });
}
