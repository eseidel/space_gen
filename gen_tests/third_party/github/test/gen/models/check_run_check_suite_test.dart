// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CheckRunCheckSuite', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CheckRunCheckSuite(id: 0);
      final parsed = CheckRunCheckSuite.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CheckRunCheckSuite.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CheckRunCheckSuite.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
