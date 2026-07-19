// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateGuildTemplateRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UpdateGuildTemplateRequest();
      final parsed = UpdateGuildTemplateRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateGuildTemplateRequest.maybeFromJson(null), isNull);
    });
  });
}
