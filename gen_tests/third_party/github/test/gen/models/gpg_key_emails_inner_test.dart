// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GpgKeyEmailsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GpgKeyEmailsInner();
      final parsed = GpgKeyEmailsInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GpgKeyEmailsInner.maybeFromJson(null), isNull);
    });
  });
}
