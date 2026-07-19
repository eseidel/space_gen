// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateAttestation201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateAttestation201Response();
      final parsed = ReposCreateAttestation201Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateAttestation201Response.maybeFromJson(null), isNull);
    });
  });
}
