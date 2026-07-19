// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SelectedActions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SelectedActions();
      final parsed = SelectedActions.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SelectedActions.maybeFromJson(null), isNull);
    });
  });
}
