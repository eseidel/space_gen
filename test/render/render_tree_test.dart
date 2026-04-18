import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/render/templates.dart';
import 'package:space_gen/src/render/tree_visitor.dart';
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

class _Collector extends RenderTreeVisitor {
  final List<RenderSchema> visited = [];

  @override
  void visitSchema(RenderSchema schema) => visited.add(schema);
}

void main() {
  group('variableSafeName', () {
    test('basic', () {
      const quirks = Quirks();
      String makeSafe(String jsonName) => variableSafeName(quirks, jsonName);
      expect(makeSafe('a-b'), 'aB');
      expect(makeSafe('a b'), 'aB');
      expect(makeSafe('a b'), 'aB');
      expect(makeSafe('aB'), 'aB');
    });

    test('enum names', () {
      const quirks = Quirks();
      expect(quirks.screamingCapsEnums, isFalse);
      final names = RenderEnum.variableNamesFor(quirks, [
        'shortCamel',
        'TallCamel',
        'snake_case',
        'skewer-case',
        'ALL_CAPS',
      ]);
      expect(names, [
        'shortCamel',
        'tallCamel',
        'snakeCase',
        'skewerCase',
        'allCaps',
      ]);
    });

    test('parameter names', () {
      const quirks = Quirks();
      expect(quirks.screamingCapsEnums, isFalse);
      const common = CommonProperties.test(
        snakeName: 'a-b',
        pointer: JsonPointer.empty(),
      );
      const parameter = RenderParameter(
        description: 'Foo',
        name: 'a-b',
        type: RenderUnknown(common: common),
        isRequired: true,
        isDeprecated: false,
        inLocation: ParameterLocation.query,
      );
      expect(parameter.dartParameterName(quirks), 'aB');
    });
  });

  group('createDocComment', () {
    test('basic', () {
      expect(
        createDocCommentFromParts(title: 'Foo', body: 'Bar', indent: 4),
        '/// Foo\n    /// Bar\n    ',
      );
      expect(
        createDocCommentFromParts(title: 'Foo', body: 'Bar'),
        '/// Foo\n/// Bar\n',
      );
    });

    test('empty', () {
      expect(createDocCommentFromParts(indent: 4), isNull);
    });

    test('title only', () {
      expect(
        createDocCommentFromParts(title: 'Foo\nBar', indent: 4),
        '/// Foo\n    /// Bar\n    ',
      );
    });

    test('body only', () {
      expect(
        createDocCommentFromParts(body: 'Bar\nBaz', indent: 4),
        '/// Bar\n    /// Baz\n    ',
      );
    });

    test('long line wrapping', () {
      const longLine =
          'This is a very long line that should be wrapped to eighty '
          'characters by the doc comment generator.';
      expect(
        createDocCommentFromParts(body: longLine, indent: 4),
        '/// This is a very long line that should be wrapped to eighty characters by\n'
        '    /// the doc comment generator.\n'
        '    ',
      );
    });
  });

  group('indentWithTrailingNewline', () {
    test('basic', () {
      expect(
        indentWithTrailingNewline(['Foo', 'Bar'], indent: 4),
        'Foo\n    Bar\n    ',
      );
    });

    test('empty', () {
      expect(indentWithTrailingNewline([], indent: 4), isNull);
    });

    test('single line', () {
      expect(indentWithTrailingNewline(['Foo'], indent: 4), 'Foo\n    ');
    });

    test('trailing newline', () {
      // This doesn't seem right?
      expect(indentWithTrailingNewline(['Foo\n'], indent: 4), 'Foo\n\n    ');
    });
  });

  group('equalsIgnoringName', () {
    test('RenderObject', () {
      const a = RenderObject(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{},
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderObject(
        common: CommonProperties.test(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{},
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderObject(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{
          'a': RenderUnknown(
            common: CommonProperties.test(
              snakeName: 'a',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
          ),
        },
      );
      expect(a.equalsIgnoringName(c), isFalse);

      const d = RenderObject(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{
          'a': RenderPod(
            common: CommonProperties.test(
              snakeName: 'a',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
            type: PodType.boolean,
          ),
        },
      );
      expect(a.equalsIgnoringName(d), isFalse);

      const e = RenderObject(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{},
        additionalProperties: RenderPod(
          common: CommonProperties.test(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          type: PodType.boolean,
        ),
      );
      expect(a.equalsIgnoringName(e), isFalse);

      const f = RenderObject(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{},
        requiredProperties: ['a'],
      );
      expect(a.equalsIgnoringName(f), isFalse);

      const g = RenderObject(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{},
        additionalProperties: RenderPod(
          common: CommonProperties.test(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          type: PodType.dateTime,
        ),
      );
      expect(e.equalsIgnoringName(g), isFalse);

      const h = RenderObject(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        properties: <String, RenderSchema>{
          'e': RenderPod(
            common: CommonProperties.test(
              snakeName: 'e',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
            type: PodType.boolean,
          ),
        },
      );
      expect(d.equalsIgnoringName(h), isFalse);
    });

    test('RenderString', () {
      const a = RenderString(
        createsNewType: false,
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        defaultValue: 'foo',
        maxLength: 10,
        minLength: 1,
        pattern: 'foo',
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderString(
        createsNewType: false,
        common: CommonProperties.test(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        defaultValue: 'foo',
        maxLength: null,
        minLength: 1,
        pattern: 'foo',
      );
      expect(a.equalsIgnoringName(b), isFalse);

      const c = RenderString(
        createsNewType: false,
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        defaultValue: 'foo',
        maxLength: 10,
        minLength: null,
        pattern: 'foo',
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderInteger', () {
      const a = RenderInteger(
        createsNewType: false,
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        defaultValue: 1,
        maximum: 10,
        minimum: 1,
        exclusiveMaximum: 10,
        exclusiveMinimum: 1,
        multipleOf: 1,
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderInteger(
        createsNewType: false,
        common: CommonProperties.test(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        defaultValue: 1,
        maximum: null,
        minimum: 1,
        exclusiveMaximum: null,
        exclusiveMinimum: null,
        multipleOf: null,
      );
      expect(a.equalsIgnoringName(b), isFalse);

      const c = RenderInteger(
        createsNewType: false,
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        defaultValue: 1,
        maximum: 10,
        minimum: null,
        exclusiveMaximum: null,
        exclusiveMinimum: null,
        multipleOf: 1,
      );
      expect(b.equalsIgnoringName(c), isFalse);
    });

    test('RenderArray', () {
      const a = RenderArray(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        items: RenderPod(
          common: CommonProperties.test(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          type: PodType.boolean,
        ),
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderArray(
        common: CommonProperties.test(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        items: RenderPod(
          common: CommonProperties.test(
            snakeName: 'b',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          type: PodType.boolean,
        ),
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderArray(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        items: RenderPod(
          common: CommonProperties.test(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          type: PodType.dateTime,
        ),
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderEnum', () {
      final a = RenderEnum(
        common: const CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        names: const ['a', 'b', 'c'],
        values: const ['a', 'b', 'c'],
      );
      expect(a.equalsIgnoringName(a), isTrue);

      final b = RenderEnum(
        common: const CommonProperties.test(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        names: const ['a', 'b', 'c'],
        values: const ['a', 'b', 'c'],
      );
      expect(a.equalsIgnoringName(b), isTrue);

      final c = RenderEnum(
        common: const CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        names: const ['a', 'b'],
        values: const ['a', 'b'],
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderOneOf', () {
      const a = RenderOneOf(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        schemas: [
          RenderPod(
            common: CommonProperties.test(
              snakeName: 'a',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
            type: PodType.boolean,
          ),
        ],
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderOneOf(
        common: CommonProperties.test(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        schemas: [
          RenderPod(
            common: CommonProperties.test(
              snakeName: 'b',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
            type: PodType.boolean,
          ),
        ],
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderOneOf(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'Foo',
        ),
        schemas: [
          RenderPod(
            common: CommonProperties.test(
              snakeName: 'a',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
            type: PodType.boolean,
          ),
          RenderPod(
            common: CommonProperties.test(
              snakeName: 'b',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
            type: PodType.boolean,
          ),
        ],
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });
  });

  group('additionalImports', () {
    test('basic', () {
      expect(
        const RenderObject(
          common: CommonProperties.test(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          properties: <String, RenderSchema>{},
        ).additionalImports,
        isEmpty,
      );
    });

    test('deprecated', () {
      expect(
        const RenderObject(
          common: CommonProperties.test(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          properties: <String, RenderSchema>{
            'a': RenderString(
              createsNewType: false,
              common: CommonProperties.test(
                snakeName: 'a',
                pointer: JsonPointer.empty(),
                description: 'Foo',
                isDeprecated: true,
              ),
              defaultValue: 'foo',
              maxLength: null,
              minLength: null,
              pattern: null,
            ),
          },
        ).additionalImports,
        equals([const Import('package:meta/meta.dart')]),
      );
    });

    test('uriTemplate', () {
      expect(
        const RenderPod(
          common: CommonProperties.test(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
          type: PodType.uriTemplate,
        ).additionalImports,
        equals([const Import('package:uri/uri.dart')]),
      );
    });
  });

  group('RenderRecursiveRef', () {
    const ref = RenderRecursiveRef(
      common: CommonProperties.test(
        snakeName: 'node',
        pointer: JsonPointer.empty(),
      ),
      targetPointer: JsonPointer.empty(),
    );

    test('is a newtype but does not render its own file', () {
      // createsNewType=true so the walker/import logic treats it like any
      // other newtype at a use site; rendersToSeparateFile is handled by
      // FileRenderer and excludes RenderRecursiveRef specifically.
      expect(ref.createsNewType, isTrue);
      expect(ref.shouldCallToJson, isTrue);
      expect(ref.defaultValue, isNull);
      expect(ref.defaultCanConstConstruct, isFalse);
    });

    test('typeName is derived from snakeName', () {
      expect(ref.typeName, 'Node');
    });

    test('jsonStorageType is always Map<String, dynamic>', () {
      expect(ref.jsonStorageType(isNullable: false), 'Map<String, dynamic>');
      expect(ref.jsonStorageType(isNullable: true), 'Map<String, dynamic>?');
    });

    test('toJsonExpression', () {
      final templates = TemplateProvider.defaultLocation();
      final context = SchemaRenderer(templates: templates);
      expect(
        ref.toJsonExpression('foo', context, dartIsNullable: false),
        'foo.toJson()',
      );
      expect(
        ref.toJsonExpression('foo', context, dartIsNullable: true),
        'foo?.toJson()',
      );
    });

    test('fromJsonExpression', () {
      final templates = TemplateProvider.defaultLocation();
      final context = SchemaRenderer(templates: templates);
      expect(
        ref.fromJsonExpression(
          'json',
          context,
          jsonIsNullable: false,
          dartIsNullable: false,
        ),
        'Node.fromJson(json as Map<String, dynamic>)',
      );
      expect(
        ref.fromJsonExpression(
          'json',
          context,
          jsonIsNullable: true,
          dartIsNullable: true,
        ),
        'Node.maybeFromJson(json as Map<String, dynamic>?)',
      );
    });

    test('toTemplateContext throws — never rendered directly', () {
      final templates = TemplateProvider.defaultLocation();
      final context = SchemaRenderer(templates: templates);
      expect(
        () => ref.toTemplateContext(context),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('walker visits it as a leaf (collected, not recursed)', () {
      // RenderObject holds a RenderRecursiveRef among its properties.
      // collectSchemasUnderSchema returns them both so the file renderer
      // can emit the import for the ref target.
      const nodeObject = RenderObject(
        common: CommonProperties.test(
          snakeName: 'node',
          pointer: JsonPointer.empty(),
        ),
        properties: {
          'left': RenderRecursiveRef(
            common: CommonProperties.test(
              snakeName: 'node',
              pointer: JsonPointer.empty(),
            ),
            targetPointer: JsonPointer.empty(),
          ),
        },
      );
      final collector = _Collector();
      RenderTreeWalker(visitor: collector).walkSchema(nodeObject);
      expect(collector.visited.whereType<RenderObject>().length, 1);
      expect(collector.visited.whereType<RenderRecursiveRef>().length, 1);
    });

    test('equality is based on pointer + snakeName + targetPointer', () {
      const a = RenderRecursiveRef(
        common: CommonProperties.test(
          snakeName: 'node',
          pointer: JsonPointer.empty(),
        ),
        targetPointer: JsonPointer.empty(),
      );
      const b = RenderRecursiveRef(
        common: CommonProperties.test(
          snakeName: 'node',
          pointer: JsonPointer.empty(),
        ),
        targetPointer: JsonPointer.empty(),
      );
      final differentTarget = RenderRecursiveRef(
        common: const CommonProperties.test(
          snakeName: 'node',
          pointer: JsonPointer.empty(),
        ),
        targetPointer: JsonPointer.parse('#/components/schemas/Node'),
      );
      expect(a, equals(b));
      expect(a, isNot(equals(differentTarget)));
    });
  });
}
