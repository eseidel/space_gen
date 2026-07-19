// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCacheList', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCacheList(
        totalCount: 2,
        actionsCaches: <ActionsCacheListActionsCachesInner>[
          ActionsCacheListActionsCachesInner(),
        ],
      );
      final parsed = ActionsCacheList.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCacheList.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCacheList.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
