// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateStageInstanceRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UpdateStageInstanceRequest();
      final parsed = UpdateStageInstanceRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateStageInstanceRequest.maybeFromJson(null), isNull);
    });
  });
}
