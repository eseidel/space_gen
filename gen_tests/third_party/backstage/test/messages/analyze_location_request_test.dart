// GENERATED — do not hand-edit.
import 'package:backstage/api.dart';
import 'package:test/test.dart';

void main() {
  group('AnalyzeLocationRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AnalyzeLocationRequest(
        location: LocationInput(type: 'example', target: 'example'),
      );
      final parsed = AnalyzeLocationRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AnalyzeLocationRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AnalyzeLocationRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
