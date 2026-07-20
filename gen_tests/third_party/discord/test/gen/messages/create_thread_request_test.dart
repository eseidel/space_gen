// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateThreadRequest', () {
    test('CreateForumThreadRequest round-trips via maybeFromJson/toJson', () {
      final instance = CreateForumThreadRequest(
        name: 'example',
        message: BaseCreateMessageCreateRequest(),
      );
      final parsed = CreateForumThreadRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'CreateTextThreadWithoutMessageRequest round-trips via maybeFromJson/toJson',
      () {
        final instance = CreateTextThreadWithoutMessageRequest(name: 'example');
        final parsed = CreateTextThreadWithoutMessageRequest.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(CreateThreadRequest.maybeFromJson(null), isNull);
    });
  });
}
