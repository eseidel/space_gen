// GENERATED — do not hand-edit.
import 'package:test/test.dart';
import 'package:types/api.dart';

void main() {
  group('Widget', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Widget(
        id: 0,
        tags: <String>['example'],
        attributes: {'key': 'example'},
      );
      final parsed = Widget.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Widget.maybeFromJson(null), isNull);
    });
  });
}
