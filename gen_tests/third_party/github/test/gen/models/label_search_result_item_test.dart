// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('LabelSearchResultItem', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = LabelSearchResultItem(
        id: 0,
        nodeId: 'example',
        url: Uri.parse('https://example.com'),
        name: 'example',
        color: 'example',
        default_: false,
        description: 'example',
        score: 0,
      );
      final parsed = LabelSearchResultItem.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LabelSearchResultItem.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LabelSearchResultItem.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
