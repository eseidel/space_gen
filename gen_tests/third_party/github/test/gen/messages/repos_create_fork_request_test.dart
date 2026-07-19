// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateForkRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateForkRequest();
      final parsed = ReposCreateForkRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateForkRequest.maybeFromJson(null), isNull);
    });
  });
}
