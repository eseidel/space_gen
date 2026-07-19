// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetEntitiesByRefsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetEntitiesByRefsRequest(
        entityRefs: <String>['example'],
      );
      final parsed = GetEntitiesByRefsRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetEntitiesByRefsRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetEntitiesByRefsRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
