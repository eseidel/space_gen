// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ConnectedAccountResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ConnectedAccountResponse(
        id: 'example',
        name: 'example',
        type: ConnectedAccountProviders.battlenet,
        friendSync: false,
        showActivity: false,
        twoWayLink: false,
        verified: false,
        visibility: ConnectedAccountVisibility.none,
      );
      final parsed = ConnectedAccountResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ConnectedAccountResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ConnectedAccountResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
