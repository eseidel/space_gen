// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertPackage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependabotAlertPackage(
        ecosystem: 'example',
        name: 'example',
      );
      final parsed = DependabotAlertPackage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotAlertPackage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertPackage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
