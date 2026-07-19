// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('NetworkConfiguration', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = NetworkConfiguration(
        id: '123ABC456DEF789',
        name: 'my-network-configuration',
        createdOn: DateTime.utc(2024),
      );
      final parsed = NetworkConfiguration.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(NetworkConfiguration.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => NetworkConfiguration.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
