// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateDeployment202Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateDeployment202Response();
      final parsed = ReposCreateDeployment202Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateDeployment202Response.maybeFromJson(null), isNull);
    });
  });
}
