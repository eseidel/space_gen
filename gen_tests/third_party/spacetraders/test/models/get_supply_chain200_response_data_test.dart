// GENERATED — do not hand-edit.
import 'package:spacetraders/api.dart';
import 'package:test/test.dart';

void main() {
  group('GetSupplyChain200ResponseData', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GetSupplyChain200ResponseData(
        exportToImportMap: {
          'key': <String>['example'],
        },
      );
      final parsed = GetSupplyChain200ResponseData.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GetSupplyChain200ResponseData.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GetSupplyChain200ResponseData.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
