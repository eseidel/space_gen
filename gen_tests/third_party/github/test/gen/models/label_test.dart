// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Label', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Label(
        id: 208045946,
        nodeId: 'MDU6TGFiZWwyMDgwNDU5NDY=',
        url: Uri.parse('https://example.com'),
        name: 'bug',
        description: "Something isn't working",
        color: 'FFFFFF',
        default_: false,
      );
      final parsed = Label.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Label.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Label.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
