// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecurityAdvisoryEpss', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecurityAdvisoryEpss();
      final parsed = SecurityAdvisoryEpss.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecurityAdvisoryEpss.maybeFromJson(null), isNull);
    });
  });
}
