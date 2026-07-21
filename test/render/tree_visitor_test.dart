import 'package:space_gen/src/render.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/tree_visitor.dart';
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

RenderObject _object(
  String name, {
  Map<String, RenderSchema> properties = const {},
  String? parentSealedTypeName,
}) => RenderObject(
  common: CommonProperties.test(
    snakeName: name.toLowerCase(),
    pointer: JsonPointer.parse('#/components/schemas/${name.toLowerCase()}'),
    description: name,
  ),
  assignedName: name,
  properties: properties,
  parentSealedTypeName: parentSealedTypeName,
);

void main() {
  group('schemasNamedBy', () {
    test('stops at a newtype boundary', () {
      // Outer names a Nested-typed field; Nested owns a Deep-typed one.
      // Deep is named only in Nested's own file, so Outer must not
      // import it — this is the over-reporting that made the import
      // decision fall back to grepping rendered output.
      final deep = _object('Deep');
      final nested = _object('Nested', properties: {'deep': deep});
      final outer = _object('Outer', properties: {'nested': nested});

      final named = schemasNamedBy(outer);
      expect(named.imported, contains(nested));
      expect(named.imported, isNot(contains(deep)));
      expect(named.imported, isNot(contains(outer)));
    });

    test('collapses distinct instances that share a pointer', () {
      // `toRenderSchema` builds a fresh instance per `$ref` site, so one
      // definition reached through two fields arrives as two instances
      // with the same pointer. They must collapse — the file, and the
      // import naming it, is one. This is the dedup RenderSchema equality
      // used to back; it now lives here, keyed on pointer.
      final first = _object('Nested');
      final second = _object('Nested');
      expect(identical(first, second), isFalse);
      expect(first.pointer, second.pointer);
      final outer = _object('Outer', properties: {'a': first, 'b': second});

      final imported = schemasNamedBy(outer).imported;
      expect(imported.where((s) => s.pointer == first.pointer), hasLength(1));
    });

    test('descends through inline structure to the newtype inside', () {
      // `List<Deep>` names Deep even though the array itself is inline.
      final deep = _object('Deep');
      final list = RenderArray(
        common: CommonProperties.test(
          snakeName: 'list',
          pointer: JsonPointer.parse('#/components/schemas/outer/list'),
          description: 'List',
        ),
        items: deep,
      );
      final outer = _object('Outer', properties: {'list': list});

      final named = schemasNamedBy(outer);
      expect(named.imported, contains(deep));
      expect(named.inline, contains(list));
    });

    test('descends into a smooshed variant, which has no file of its '
        'own', () {
      // A smooshed variant is emitted inline in its sealed parent's
      // library, so the parent names whatever the variant names — and
      // must not import the variant itself.
      final deep = _object('Deep');
      final variant = _object(
        'Variant',
        properties: {'deep': deep},
        parentSealedTypeName: 'Outer',
      );
      final outer = _object('Outer', properties: {'variant': variant});

      final named = schemasNamedBy(outer);
      expect(variant.isSmooshed, isTrue);
      expect(named.inline, contains(variant));
      expect(named.imported, isNot(contains(variant)));
      expect(named.imported, contains(deep));
    });

    test('a oneOf that emits the stub names none of its variants', () {
      // A synthesized oneOf (no resolved source) falls back to the
      // `UnimplementedError` stub, whose body names no variant. github's
      // `IssueEventForIssue` is the real case: 15 variants, none of
      // which the emitted file mentions.
      final variantA = _object('VariantA');
      final variantB = _object('VariantB');
      final oneOf = RenderOneOf(
        common: CommonProperties.test(
          snakeName: 'choice',
          pointer: JsonPointer.parse('#/components/schemas/choice'),
          description: 'Choice',
        ),
        schemas: [variantA, variantB],
        discriminator: null,
        source: null,
        assignedName: 'Choice',
        assignedSnakeName: 'choice',
      );

      expect(oneOf.emitsVariantDispatch, isFalse);
      final named = schemasNamedBy(oneOf);
      expect(named.imported, isEmpty);
    });

    test('a oneOf that dispatches descends into its variants', () {
      // The other side of the stub case. These two variants dispatch on
      // which required key is present, so the emitted body constructs
      // each one and names what it names. They are inline, so they are
      // smooshed into the parent's library rather than imported — but
      // the descent is the point: no dispatch, no descent.
      final oneOf = renderTestSchemaTree({
        'oneOf': [
          {
            'type': 'object',
            'required': ['a'],
            'properties': {
              'a': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'required': ['b'],
            'properties': {
              'b': {'type': 'string'},
            },
          },
        ],
      }, schemaName: 'choice');

      expect(oneOf, isA<RenderOneOf>());
      expect((oneOf as RenderOneOf).emitsVariantDispatch, isTrue);
      expect(schemasNamedBy(oneOf).inline, isNotEmpty);
    });

    test('descends into additionalProperties', () {
      // `Map<String, Deep>` as a schema's additionalProperties names
      // Deep, the same as a declared field of that type would.
      final deep = _object('Deep');
      final outer = RenderObject(
        common: CommonProperties.test(
          snakeName: 'outer',
          pointer: JsonPointer.parse('#/components/schemas/outer'),
          description: 'Outer',
        ),
        assignedName: 'Outer',
        properties: const {},
        additionalProperties: deep,
      );

      expect(schemasNamedBy(outer).imported, contains(deep));
    });

    test('descends into a map key schema', () {
      // A typed key is an enum the file round-trips each key through, so
      // it is named just like the value type.
      final keyEnum = RenderStringEnum(
        common: CommonProperties.test(
          snakeName: 'key_kind',
          pointer: JsonPointer.parse('#/components/schemas/key_kind'),
          description: 'KeyKind',
        ),
        assignedName: 'KeyKind',
        values: const ['a'],
        names: const ['a'],
        descriptions: null,
      );
      final value = _object('Value');
      final map = RenderMap(
        common: CommonProperties.test(
          snakeName: 'map',
          pointer: JsonPointer.parse('#/components/schemas/outer/map'),
          description: 'Map',
        ),
        valueSchema: value,
        keySchema: keyEnum,
      );
      final outer = _object('Outer', properties: {'map': map});

      final imported = schemasNamedBy(outer).imported;
      expect(imported, contains(keyEnum));
      expect(imported, contains(value));
    });
  });
}
