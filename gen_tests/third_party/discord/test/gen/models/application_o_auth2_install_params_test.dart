// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationOAuth2InstallParams', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationOAuth2InstallParams();
      final parsed = ApplicationOAuth2InstallParams.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationOAuth2InstallParams.maybeFromJson(null), isNull);
    });
  });
}
