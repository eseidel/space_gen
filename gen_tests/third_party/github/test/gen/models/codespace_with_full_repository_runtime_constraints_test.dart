// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodespaceWithFullRepositoryRuntimeConstraints', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodespaceWithFullRepositoryRuntimeConstraints();
      final parsed =
          CodespaceWithFullRepositoryRuntimeConstraints.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodespaceWithFullRepositoryRuntimeConstraints.maybeFromJson(null),
        isNull,
      );
    });
  });
}
