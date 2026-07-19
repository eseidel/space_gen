// GENERATED — do not hand-edit.
import 'package:const_property/api.dart';
import 'package:test/test.dart';

void main() {
  group('ListResp', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ListResp(count: 0);
      final parsed = ListResp.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ListResp.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ListResp.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
