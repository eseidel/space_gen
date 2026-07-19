// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCacheUsageByRepository', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCacheUsageByRepository(
        fullName: 'octo-org/Hello-World',
        activeCachesSizeInBytes: 2322142,
        activeCachesCount: 3,
      );
      final parsed = ActionsCacheUsageByRepository.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCacheUsageByRepository.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCacheUsageByRepository.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
