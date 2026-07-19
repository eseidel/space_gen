// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetSupplyChain200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetSupplyChain200Response(
        data: GetSupplyChain200ResponseData(
          exportToImportMap: {
            'key': <String>['example'],
          },
        ),
      );
      final parsed = GetSupplyChain200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetSupplyChain200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetSupplyChain200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
