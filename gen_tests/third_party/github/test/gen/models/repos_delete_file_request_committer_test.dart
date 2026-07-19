// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposDeleteFileRequestCommitter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposDeleteFileRequestCommitter();
      final parsed = ReposDeleteFileRequestCommitter.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposDeleteFileRequestCommitter.maybeFromJson(null), isNull);
    });
  });
}
