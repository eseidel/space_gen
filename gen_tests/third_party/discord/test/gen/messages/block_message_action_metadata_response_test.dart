// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BlockMessageActionMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BlockMessageActionMetadataResponse();
      final parsed = BlockMessageActionMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BlockMessageActionMetadataResponse.maybeFromJson(null), isNull);
    });
  });
}
