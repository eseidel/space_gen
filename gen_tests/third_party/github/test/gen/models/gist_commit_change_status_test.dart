// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GistCommitChangeStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GistCommitChangeStatus();
      final parsed = GistCommitChangeStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GistCommitChangeStatus.maybeFromJson(null), isNull);
    });
  });
}
