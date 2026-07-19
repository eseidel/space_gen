// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SshSigningKey', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SshSigningKey(
        key: 'example',
        id: 0,
        title: 'example',
        createdAt: DateTime.utc(2024),
      );
      final parsed = SshSigningKey.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SshSigningKey.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SshSigningKey.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
