// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BulkUpdateGuildChannelsRequestInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BulkUpdateGuildChannelsRequestInner();
      final parsed = BulkUpdateGuildChannelsRequestInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BulkUpdateGuildChannelsRequestInner.maybeFromJson(null), isNull);
    });
  });
}
