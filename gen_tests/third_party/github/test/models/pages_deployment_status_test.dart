// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PagesDeploymentStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PagesDeploymentStatus();
      final parsed = PagesDeploymentStatus.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PagesDeploymentStatus.maybeFromJson(null), isNull);
    });
  });
}
