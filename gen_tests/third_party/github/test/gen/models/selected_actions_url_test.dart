// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SelectedActionsUrl', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SelectedActionsUrl('example');
      final parsed = SelectedActionsUrl.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SelectedActionsUrl.maybeFromJson(null), isNull);
    });
  });
}
