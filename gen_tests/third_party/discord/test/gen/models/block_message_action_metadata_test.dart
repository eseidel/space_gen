// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BlockMessageActionMetadata', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BlockMessageActionMetadata();
      final parsed = BlockMessageActionMetadata.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BlockMessageActionMetadata.maybeFromJson(null), isNull);
    });
  });
}
