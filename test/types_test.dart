import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

void main() {
  group('JsonPointer', () {
    test('baseUri disambiguates identity but not the emitted fragment', () {
      const root = JsonPointer.fromParts(['components', 'schemas', 'Foo']);
      final external = JsonPointer.fromParts(
        const ['components', 'schemas', 'Foo'],
        baseUri: Uri.parse('file:///shared.json'),
      );
      // Same parts in two documents are distinct types (#358), so `$ref`s
      // into each resolve, name, and file separately.
      expect(external, isNot(equals(root)));
      expect({root, external}, hasLength(2));
      // The base is identity-only: the ref-resolvable fragment is unchanged,
      // so the registry key (`specUrl.resolve(fragment)`) still lands on the
      // right document.
      expect(external.urlEncodedFragment, root.urlEncodedFragment);
      expect(external.urlEncodedFragment, '#/components/schemas/Foo');
    });

    test('add preserves baseUri', () {
      final external = JsonPointer.fromParts(
        const ['components'],
        baseUri: Uri.parse('file:///shared.json'),
      );
      final child = external.add('schemas');
      expect(child.baseUri, Uri.parse('file:///shared.json'));
      expect(child.parts, ['components', 'schemas']);
    });
  });

  group('CommonProperties', () {
    test('copyWith', () {
      const common = CommonProperties.test(
        pointer: JsonPointer.fromParts(['foo']),
        snakeName: 'foo',
        title: 'Foo',
        description: 'Foo description',
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
      final noChange = common.copyWith();
      expect(noChange, equals(common));
    });
  });
}
