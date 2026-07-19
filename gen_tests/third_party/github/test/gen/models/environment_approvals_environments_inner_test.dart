// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('EnvironmentApprovalsEnvironmentsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = EnvironmentApprovalsEnvironmentsInner();
      final parsed = EnvironmentApprovalsEnvironmentsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EnvironmentApprovalsEnvironmentsInner.maybeFromJson(null), isNull);
    });
  });
}
