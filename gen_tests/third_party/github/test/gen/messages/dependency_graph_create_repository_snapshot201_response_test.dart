// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependencyGraphCreateRepositorySnapshot201Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependencyGraphCreateRepositorySnapshot201Response(
        id: 0,
        createdAt: 'example',
        result: 'example',
        message: 'example',
      );
      final parsed =
          DependencyGraphCreateRepositorySnapshot201Response.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependencyGraphCreateRepositorySnapshot201Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependencyGraphCreateRepositorySnapshot201Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
