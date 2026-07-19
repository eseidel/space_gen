// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RunnerGroupsOrg', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RunnerGroupsOrg(
        id: 0,
        name: 'example',
        visibility: 'example',
        default_: false,
        runnersUrl: 'example',
        inherited: false,
        allowsPublicRepositories: false,
      );
      final parsed = RunnerGroupsOrg.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RunnerGroupsOrg.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RunnerGroupsOrg.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
