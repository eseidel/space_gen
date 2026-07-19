// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ServiceUnavailableResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ServiceUnavailableResponse();
      final parsed = ServiceUnavailableResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ServiceUnavailableResponse.maybeFromJson(null), isNull);
    });
  });
}
