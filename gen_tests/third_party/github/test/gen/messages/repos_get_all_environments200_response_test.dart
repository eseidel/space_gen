// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposGetAllEnvironments200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposGetAllEnvironments200Response();
      final parsed = ReposGetAllEnvironments200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposGetAllEnvironments200Response.maybeFromJson(null), isNull);
    });
  });
}
