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
  group('aOrAn', () {
    test('common class names', () {
      expect(aOrAn('Apple'), 'an');
      expect(aOrAn('Egg'), 'an');
      expect(aOrAn('Item'), 'an');
      expect(aOrAn('Order'), 'an');
      expect(aOrAn('User'), 'a');
      expect(aOrAn('Upload'), 'a');
      expect(aOrAn('Map'), 'a');
      expect(aOrAn('Customer'), 'a');
    });
    test('empty word defaults to a', () {
      expect(aOrAn(''), 'a');
    });
    test('lowercase first letter', () {
      expect(aOrAn('apple'), 'an');
      expect(aOrAn('user'), 'a');
    });
  });

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

    test('parameter names always camelCase under openapi quirks', () {
      // `screamingCapsEnums: true` controls enum-value casing, not every
      // identifier — petstore's `api_key` header parameter would otherwise
      // survive into generated code as a snake_case Dart variable and trip
      // `non_constant_identifier_names`.
      const quirks = Quirks.openapi();
      expect(quirks.screamingCapsEnums, isTrue);
      const common = CommonProperties.test(
        snakeName: 'api_key',
        pointer: JsonPointer.empty(),
      );
      const parameter = RenderParameter(
        description: null,
        name: 'api_key',
        type: RenderUnknown(common: common),
        isRequired: false,
        isDeprecated: false,
        inLocation: ParameterLocation.header,
      );
      expect(parameter.dartParameterName(quirks), 'apiKey');
    });

    test('enum values preserve SCREAMING_CAPS under openapi quirks', () {
      const quirks = Quirks.openapi();
      expect(quirks.screamingCapsEnums, isTrue);
      final names = RenderEnum.variableNamesFor(quirks, [
        'AVAILABLE',
        'PENDING',
        'SOLD',
      ]);
      expect(names, ['AVAILABLE', 'PENDING', 'SOLD']);
    });

    test('reserved-word parameter name is escaped in template context', () {
      // A spec with a parameter literally named `with` (or `try`/`case`/
      // ...) previously emitted `required String with` in the generated
      // signature — uncompilable. `dartName` in the template context must
      // match what `dartParameterName` returns so reserved words are
      // escaped consistently across call sites.
      final context = SchemaRenderer(
        templates: TemplateProvider.defaultLocation(),
      );
      const common = CommonProperties.test(
        snakeName: 'with',
        pointer: JsonPointer.empty(),
      );
      const parameter = RenderParameter(
        description: 'Foo',
        name: 'with',
        type: RenderUnknown(common: common),
        isRequired: true,
        isDeprecated: false,
        inLocation: ParameterLocation.query,
      );
      // The Dart-visible identifier gets `_` appended so it compiles;
      // the spec-side name and its bracketed form keep the original
      // reserved word since they name the wire-level field, not a Dart
      // identifier.
      expect(parameter.dartParameterName(context.quirks), 'with_');
      expect(parameter.name, 'with');
      expect(parameter.bracketedName, '{with}');
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

    test('wrapping does not split inside a backtick code span', () {
      // A line break inside `…` would leave an unclosed backtick on each
      // half, and the analyzer's `unintended_html_in_doc_comment` lint
      // then flags any `<…>` inside the broken span. Surfaced by github's
      // `git/matching-refs/{ref}` description, which contains
      // `` `heads/<branch name>` ``.
      const longLine =
          'The reference must be formatted as `heads/<branch name>` for '
          'branches and `tags/<tag name>` for tags.';
      final output = createDocCommentFromParts(body: longLine, indent: 4);
      expect(output, isNotNull);
      // No emitted line should contain an odd number of backticks.
      for (final line in output!.split('\n')) {
        final backticks = '`'.allMatches(line).length;
        expect(
          backticks.isEven,
          isTrue,
          reason: 'unbalanced backticks in line: $line',
        );
      }
    });
  });

  group('wrappedClassDocComment', () {
    test('short single fits on one line', () {
      expect(
        wrappedClassDocComment(
          single: 'Converts a `Map<String, dynamic>` to a [Pet].',
          first: 'Converts a `Map<String, dynamic>` to a',
          second: '[Pet].',
        ),
        '/// Converts a `Map<String, dynamic>` to a [Pet].\n    ',
      );
    });

    test(
      'long single falls back to the two-line form, and both lines fit '
      '80 cols at 2-space class indent',
      () {
        // Typical spacetraders offender: a 33-char flattened type name
        // pushes the single-line form past 80 cols when rendered at the
        // class member indent.
        const typeName = 'CreateShipWaypointScan201Response';
        final output = wrappedClassDocComment(
          single: 'Converts a `Map<String, dynamic>` to a [$typeName].',
          first: 'Converts a `Map<String, dynamic>` to a',
          second: '[$typeName].',
        );
        expect(
          output,
          '/// Converts a `Map<String, dynamic>` to a\n'
          '    /// [CreateShipWaypointScan201Response].\n'
          '    ',
        );
        for (final line in output.trimRight().split('\n')) {
          final rendered = line.startsWith('/// ') ? '  $line' : line;
          expect(rendered.length, lessThanOrEqualTo(80));
        }
      },
    );

    test('to_json phrasing keeps the `Map<String, dynamic>` token intact', () {
      const typeName = 'CreateShipWaypointScan201Response';
      expect(
        wrappedClassDocComment(
          single: 'Converts a [$typeName] to a `Map<String, dynamic>`.',
          first: 'Converts a [$typeName]',
          second: 'to a `Map<String, dynamic>`.',
        ),
        '/// Converts a [CreateShipWaypointScan201Response]\n'
        '    /// to a `Map<String, dynamic>`.\n'
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
            createsNewType: false,
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
          createsNewType: false,
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
          createsNewType: false,
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
            createsNewType: false,
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
          createsNewType: false,
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
          createsNewType: false,
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
          createsNewType: false,
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
        descriptions: null,
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
        descriptions: null,
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
        descriptions: null,
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
            createsNewType: false,
          ),
        ],
        discriminator: null,
        source: null,
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
            createsNewType: false,
          ),
        ],
        discriminator: null,
        source: null,
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
            createsNewType: false,
          ),
          RenderPod(
            common: CommonProperties.test(
              snakeName: 'b',
              pointer: JsonPointer.empty(),
              description: 'Foo',
            ),
            type: PodType.boolean,
            createsNewType: false,
          ),
        ],
        discriminator: null,
        source: null,
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderMap keySchema participates in equality', () {
      const boolValue = RenderPod(
        common: CommonProperties.test(
          snakeName: 'v',
          pointer: JsonPointer.empty(),
          description: 'v',
        ),
        type: PodType.boolean,
        createsNewType: false,
      );
      final enumKey = RenderEnum(
        common: const CommonProperties.test(
          snakeName: 'platform',
          pointer: JsonPointer.empty(),
          description: 'Platform',
        ),
        values: const ['android', 'ios'],
        names: const ['android', 'ios'],
        descriptions: null,
      );
      const noKey = RenderMap(
        common: CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'm',
        ),
        valueSchema: boolValue,
        keySchema: null,
      );
      final withKey = RenderMap(
        common: const CommonProperties.test(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          description: 'm',
        ),
        valueSchema: boolValue,
        keySchema: enumKey,
      );
      expect(noKey.equalsIgnoringName(noKey), isTrue);
      expect(withKey.equalsIgnoringName(withKey), isTrue);
      // Different keySchema (null vs enum) => not equal.
      expect(noKey.equalsIgnoringName(withKey), isFalse);
      expect(withKey.equalsIgnoringName(noKey), isFalse);
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
          createsNewType: false,
        ).additionalImports,
        equals([
          const Import('package:uri/uri.dart', shown: ['UriTemplate']),
        ]),
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
      assignedName: 'Node',
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

  group('exampleValue', () {
    final context = SchemaRenderer(
      templates: TemplateProvider.defaultLocation(),
    );
    const common = CommonProperties.test(
      snakeName: 'foo',
      pointer: JsonPointer.empty(),
    );

    test('date format produces a local DateTime literal', () {
      const schema = RenderPod(
        common: common,
        type: PodType.date,
        createsNewType: false,
      );
      expect(schema.exampleValue(context), 'DateTime(2024, 1, 1)');
    });

    test('uri format produces a Uri.parse literal', () {
      const schema = RenderPod(
        common: common,
        type: PodType.uri,
        createsNewType: false,
      );
      expect(
        schema.exampleValue(context),
        "Uri.parse('https://example.com')",
      );
    });

    test('uriTemplate format produces a UriTemplate literal', () {
      const schema = RenderPod(
        common: common,
        type: PodType.uriTemplate,
        createsNewType: false,
      );
      expect(
        schema.exampleValue(context),
        "UriTemplate('https://example.com/{id}')",
      );
    });

    test('email format produces an email string literal', () {
      const schema = RenderPod(
        common: common,
        type: PodType.email,
        createsNewType: false,
      );
      expect(schema.exampleValue(context), "'user@example.com'");
    });

    test('uuid format produces a uuid string literal', () {
      const schema = RenderPod(
        common: common,
        type: PodType.uuid,
        createsNewType: false,
      );
      expect(
        schema.exampleValue(context),
        "'00000000-0000-0000-0000-000000000000'",
      );
    });

    test('unknown returns an empty dynamic map literal', () {
      const schema = RenderUnknown(common: common);
      expect(schema.exampleValue(context), '<String, dynamic>{}');
    });

    test('void returns null (no round-trip possible)', () {
      const schema = RenderVoid(common: common);
      expect(schema.exampleValue(context), isNull);
    });

    test('binary (NoJson) returns null', () {
      const schema = RenderBinary(common: common);
      expect(schema.exampleValue(context), isNull);
    });

    test('recursive ref returns null', () {
      const schema = RenderRecursiveRef(
        common: common,
        targetPointer: JsonPointer.empty(),
      );
      expect(schema.exampleValue(context), isNull);
    });

    test('oneOf returns null (sealed class, no constructable subtype)', () {
      // `schema_one_of.mustache` emits a sealed class with no
      // concrete subclasses and an `UnimplementedError`-throwing
      // fromJson, so there's no way to construct a value of the
      // sealed type. Returning a branch example would type-check
      // against the branch but not the enclosing field, producing
      // errors like `String can't be assigned to
      // IssuesCreateRequestTitle` in generated round-trip tests. Opt
      // out via `null` so the test is skipped.
      const schema = RenderOneOf(
        common: common,
        schemas: [
          RenderPod(
            common: common,
            type: PodType.email,
            createsNewType: false,
          ),
          RenderPod(
            common: common,
            type: PodType.uuid,
            createsNewType: false,
          ),
        ],
        discriminator: null,
        source: null,
      );
      expect(schema.exampleValue(context), isNull);
    });

    test('map with keySchema uses its exampleValue', () {
      const inner = RenderString(
        createsNewType: false,
        common: common,
        defaultValue: null,
        maxLength: null,
        minLength: null,
        pattern: null,
      );
      final keySchema = RenderEnum(
        common: common,
        values: const ['a', 'b'],
        names: const ['a', 'b'],
        descriptions: null,
        assignedName: 'Foo',
      );
      final map = RenderMap(
        common: common,
        valueSchema: inner,
        keySchema: keySchema,
      );
      // Key example is the enum's first value; value is the string example.
      expect(map.exampleValue(context), "{Foo.values.first: 'example'}");
    });
  });

  group('RenderPod newtype', () {
    final context = SchemaRenderer(
      templates: TemplateProvider.defaultLocation(),
    );

    RenderPod pod(PodType type, {bool createsNewType = false}) => RenderPod(
      common: const CommonProperties.test(
        snakeName: 'foo_bar',
        pointer: JsonPointer.empty(),
      ),
      type: type,
      createsNewType: createsNewType,
      // Pass an assigned name only for newtype cases (typeName falls
      // back to the Dart primitive otherwise). Mirrors what the
      // naming pass would produce: `camelFromSnake('foo_bar')`.
      assignedName: createsNewType ? 'FooBar' : null,
    );

    test('typeName is the class name when a newtype, else the Dart type', () {
      expect(pod(PodType.dateTime).typeName, 'DateTime');
      expect(pod(PodType.email).typeName, 'String');
      expect(pod(PodType.uuid).typeName, 'String');
      expect(pod(PodType.date).typeName, 'DateTime');
      expect(pod(PodType.boolean).typeName, 'bool');
      expect(pod(PodType.uri).typeName, 'Uri');
      expect(pod(PodType.uriTemplate).typeName, 'UriTemplate');

      expect(pod(PodType.dateTime, createsNewType: true).typeName, 'FooBar');
      expect(pod(PodType.email, createsNewType: true).typeName, 'FooBar');
      expect(pod(PodType.date, createsNewType: true).typeName, 'FooBar');
    });

    test('dartType is the underlying Dart type regardless of newtype', () {
      expect(pod(PodType.dateTime).dartType, 'DateTime');
      expect(pod(PodType.dateTime, createsNewType: true).dartType, 'DateTime');
      expect(pod(PodType.email).dartType, 'String');
      expect(pod(PodType.uuid).dartType, 'String');
      expect(pod(PodType.date).dartType, 'DateTime');
    });

    test('toJsonExpression delegates to .toJson() when a newtype', () {
      final schema = pod(PodType.dateTime, createsNewType: true);
      expect(
        schema.toJsonExpression('x', context, dartIsNullable: false),
        'x.toJson()',
      );
      expect(
        schema.toJsonExpression('x', context, dartIsNullable: true),
        'x?.toJson()',
      );
    });

    test('toJsonExpression is inline for pod types when not a newtype', () {
      expect(
        pod(PodType.dateTime).toJsonExpression(
          'x',
          context,
          dartIsNullable: false,
        ),
        'x.toIso8601String()',
      );
      expect(
        pod(PodType.date).toJsonExpression(
          'x',
          context,
          dartIsNullable: true,
        ),
        'x?.toIso8601String().substring(0, 10)',
      );
      // email and uuid are Strings; no conversion, just pass dartName.
      expect(
        pod(PodType.email).toJsonExpression(
          'x',
          context,
          dartIsNullable: true,
        ),
        'x',
      );
      expect(
        pod(PodType.uuid).toJsonExpression(
          'x',
          context,
          dartIsNullable: true,
        ),
        'x',
      );
    });

    test('fromJsonExpression delegates to fromJson/maybeFromJson '
        'when a newtype', () {
      final schema = pod(PodType.date, createsNewType: true);
      expect(
        schema.fromJsonExpression(
          "json['d']",
          context,
          jsonIsNullable: false,
          dartIsNullable: false,
        ),
        "FooBar.fromJson(json['d'] as String)",
      );
      expect(
        schema.fromJsonExpression(
          "json['d']",
          context,
          jsonIsNullable: true,
          dartIsNullable: true,
        ),
        "FooBar.maybeFromJson(json['d'] as String?)",
      );
    });

    test('fromJsonExpression inline routes nullable date/uuid correctly', () {
      expect(
        pod(PodType.date).fromJsonExpression(
          "json['d']",
          context,
          jsonIsNullable: true,
          dartIsNullable: true,
        ),
        "maybeParseDate(json['d'] as String?)",
      );
      expect(
        pod(PodType.date).fromJsonExpression(
          "json['d']",
          context,
          jsonIsNullable: false,
          dartIsNullable: false,
        ),
        "DateTime.parse(json['d'] as String)",
      );
      expect(
        pod(PodType.uuid).fromJsonExpression(
          "json['u']",
          context,
          jsonIsNullable: false,
          dartIsNullable: false,
        ),
        "json['u'] as String",
      );
    });

    test('toTemplateContext throws for non-newtype', () {
      expect(
        () => pod(PodType.email).toTemplateContext(context),
        throwsStateError,
      );
    });

    test('toTemplateContext exposes the fields the newtype template reads', () {
      final ctx = pod(
        PodType.date,
        createsNewType: true,
      ).toTemplateContext(context);
      expect(ctx['typeName'], 'FooBar');
      expect(ctx['dartType'], 'DateTime');
      expect(ctx['jsonType'], 'String');
      expect(ctx['fromJsonBody'], 'DateTime.parse(json)');
      expect(ctx['toJsonBody'], 'value.toIso8601String().substring(0, 10)');

      final emailCtx = pod(
        PodType.email,
        createsNewType: true,
      ).toTemplateContext(context);
      expect(emailCtx['dartType'], 'String');
      expect(emailCtx['fromJsonBody'], 'json');
      expect(emailCtx['toJsonBody'], 'value');
    });

    test(
      'shouldCallToJson: inline pods need conversion iff non-json-native',
      () {
        expect(pod(PodType.dateTime).shouldCallToJson, isTrue);
        expect(pod(PodType.date).shouldCallToJson, isTrue);
        expect(pod(PodType.uri).shouldCallToJson, isTrue);
        expect(pod(PodType.uriTemplate).shouldCallToJson, isTrue);
        expect(pod(PodType.boolean).shouldCallToJson, isFalse);
        expect(pod(PodType.email).shouldCallToJson, isFalse);
        expect(pod(PodType.uuid).shouldCallToJson, isFalse);
        // Newtypes always serialize through .toJson() regardless of the
        // underlying Dart type.
        expect(
          pod(PodType.boolean, createsNewType: true).shouldCallToJson,
          isTrue,
        );
      },
    );

    test('defaultValueString wraps in typeName constructor when a newtype', () {
      const newtypeBool = RenderPod(
        common: CommonProperties.test(
          snakeName: 'flag',
          pointer: JsonPointer.empty(),
        ),
        type: PodType.boolean,
        createsNewType: true,
        defaultValue: true,
        assignedName: 'Flag',
      );
      expect(newtypeBool.defaultValueString(context), 'Flag(true)');

      const inlineEmail = RenderPod(
        common: CommonProperties.test(
          snakeName: 'e',
          pointer: JsonPointer.empty(),
        ),
        type: PodType.email,
        createsNewType: false,
        defaultValue: 'a@b.c',
      );
      expect(inlineEmail.defaultValueString(context), "'a@b.c'");
    });
  });

  group('strict assignedName', () {
    // typeName on a `createsNewType: true` schema constructed without
    // an `assignedName` must throw — that's the strict-mode invariant
    // that catches naming-pass bypasses (a test forgot to populate
    // `SpecResolver.names`, or a render path didn't go through one of
    // the documented entry points).
    test('newtype RenderObject without assignedName throws on typeName', () {
      const schema = RenderObject(
        common: CommonProperties.test(
          snakeName: 'foo',
          pointer: JsonPointer.empty(),
        ),
        properties: {},
      );
      expect(
        () => schema.typeName,
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            allOf(
              contains('Naming pass did not assign a name'),
              contains('snakeName: foo'),
            ),
          ),
        ),
      );
    });

    test('non-newtype RenderString returns Dart primitive without '
        'consulting assignedName', () {
      // Non-newtypes never look up assignedName; their `typeName` is
      // structural ('String', 'int', etc.). Verifies the strict
      // assertion only fires on the newtype branch.
      const inline = RenderString(
        common: CommonProperties.test(
          snakeName: 'whatever',
          pointer: JsonPointer.empty(),
        ),
        defaultValue: null,
        maxLength: null,
        minLength: null,
        pattern: null,
        createsNewType: false,
      );
      expect(inline.typeName, 'String');
    });

    test('newtype with assignedName returns it as typeName', () {
      const schema = RenderObject(
        common: CommonProperties.test(
          snakeName: 'foo',
          pointer: JsonPointer.empty(),
        ),
        properties: {},
        assignedName: 'CustomName',
      );
      expect(schema.typeName, 'CustomName');
    });
  });
}
