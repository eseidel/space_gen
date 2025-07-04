import 'package:space_gen/src/quirks.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

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
  });

  group('createDocComment', () {
    test('basic', () {
      expect(
        createDocComment(title: 'Foo', body: 'Bar', indent: 4),
        '/// Foo\n    /// Bar\n    ',
      );
      expect(createDocComment(title: 'Foo', body: 'Bar'), '/// Foo\n/// Bar\n');
    });

    test('empty', () {
      expect(createDocComment(indent: 4), isNull);
    });

    test('title only', () {
      expect(
        createDocComment(title: 'Foo\nBar', indent: 4),
        '/// Foo\n    /// Bar\n    ',
      );
    });

    test('body only', () {
      expect(
        createDocComment(body: 'Bar\nBaz', indent: 4),
        '/// Bar\n    /// Baz\n    ',
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
  });
}
