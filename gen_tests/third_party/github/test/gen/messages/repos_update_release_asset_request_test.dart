// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateReleaseAssetRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateReleaseAssetRequest();
      final parsed = ReposUpdateReleaseAssetRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateReleaseAssetRequest.maybeFromJson(null), isNull);
    });
  });
}
