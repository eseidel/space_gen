// GENERATED — do not hand-edit.
import 'package:multipart/api.dart';
import 'package:test/test.dart';

void main() {
  group('UploadArrayFieldsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UploadArrayFieldsRequest(
        brands: const <String>['example'],
        counts: const <int>[0],
      );
      final parsed = UploadArrayFieldsRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UploadArrayFieldsRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UploadArrayFieldsRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
