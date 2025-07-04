import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

void main() {
  group('CommonProperties', () {
    test('copyWith', () {
      const common = CommonProperties(
        pointer: JsonPointer.fromParts(['foo']),
        snakeName: 'foo',
        title: 'Foo',
        description: 'Foo description',
        isDeprecated: false,
        nullable: false,
      );
      final copy = common.copyWith(
        pointer: const JsonPointer.fromParts(['bar']),
        snakeName: 'bar',
        title: 'Bar',
        description: 'Bar description',
        isDeprecated: true,
        nullable: true,
      );
      expect(copy.pointer, const JsonPointer.fromParts(['bar']));
      expect(copy.snakeName, 'bar');
      expect(copy.title, 'Bar');
      expect(copy.description, 'Bar description');
      expect(copy.isDeprecated, true);
      expect(copy.nullable, true);
    });
  });
}
