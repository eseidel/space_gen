// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeFrequencyStat', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeFrequencyStat(<int>[0]);
      final parsed = CodeFrequencyStat.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeFrequencyStat.maybeFromJson(null), isNull);
    });
  });
}
