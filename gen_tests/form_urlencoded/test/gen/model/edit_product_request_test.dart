// GENERATED — do not hand-edit.
import 'package:form_urlencoded/api.dart';
import 'package:test/test.dart';

void main() {
  group('EditProductRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = EditProductRequest(
        code: 'example',
        brands: const <String>['example'],
      );
      final parsed = EditProductRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(EditProductRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => EditProductRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
