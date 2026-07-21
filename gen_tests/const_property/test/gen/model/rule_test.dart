// GENERATED — do not hand-edit.
import 'package:const_property/api.dart';
import 'package:test/test.dart';

void main() {
  group('Rule', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Rule();
      final parsed = Rule.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Rule.maybeFromJson(null), isNull);
    });
  });
}
