// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GlobalAdvisoryIdentifiersInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GlobalAdvisoryIdentifiersInner(
        type: GlobalAdvisoryIdentifiersInnerType.cve,
        value: 'example',
      );
      final parsed = GlobalAdvisoryIdentifiersInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GlobalAdvisoryIdentifiersInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GlobalAdvisoryIdentifiersInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
