// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('SystemSymbol', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SystemSymbol('example');
      final parsed = SystemSymbol.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SystemSymbol.maybeFromJson(null), isNull);
    });
  });
}
