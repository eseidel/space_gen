// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateReleaseRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateReleaseRequest();
      final parsed = ReposUpdateReleaseRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateReleaseRequest.maybeFromJson(null), isNull);
    });
  });
}
