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
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{},
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderObject(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{},
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{
          'a': RenderUnknown(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            description: 'Foo',
          ),
        },
      );
      expect(a.equalsIgnoringName(c), isFalse);

      const d = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{
          'a': RenderPod(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            type: PodType.boolean,
            description: 'Foo',
          ),
        },
      );
      expect(a.equalsIgnoringName(d), isFalse);

      const e = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{},
        additionalProperties: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.boolean,
          description: 'Foo',
        ),
      );
      expect(a.equalsIgnoringName(e), isFalse);

      const f = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{},
        requiredProperties: ['a'],
      );
      expect(a.equalsIgnoringName(f), isFalse);

      const g = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{},
        additionalProperties: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.dateTime,
          description: 'Foo',
        ),
      );
      expect(e.equalsIgnoringName(g), isFalse);

      const h = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        properties: <String, RenderSchema>{
          'e': RenderPod(
            snakeName: 'e',
            pointer: JsonPointer.empty(),
            type: PodType.boolean,
            description: 'Foo',
          ),
        },
      );
      expect(d.equalsIgnoringName(h), isFalse);
    });

    test('RenderString', () {
      const a = RenderString(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        defaultValue: 'foo',
        maxLength: 10,
        minLength: 1,
        pattern: 'foo',
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderString(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        defaultValue: 'foo',
        maxLength: null,
        minLength: 1,
        pattern: 'foo',
      );
      expect(a.equalsIgnoringName(b), isFalse);

      const c = RenderString(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        defaultValue: 'foo',
        maxLength: 10,
        minLength: null,
        pattern: 'foo',
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderInteger', () {
      const a = RenderInteger(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        defaultValue: 1,
        maximum: 10,
        minimum: 1,
        exclusiveMaximum: 10,
        exclusiveMinimum: 1,
        multipleOf: 1,
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderInteger(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        defaultValue: 1,
        maximum: null,
        minimum: 1,
        exclusiveMaximum: null,
        exclusiveMinimum: null,
        multipleOf: null,
      );
      expect(a.equalsIgnoringName(b), isFalse);

      const c = RenderInteger(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
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
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        items: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.boolean,
          description: 'Foo',
        ),
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderArray(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        items: RenderPod(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          type: PodType.boolean,
          description: 'Foo',
        ),
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderArray(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        items: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.dateTime,
          description: 'Foo',
        ),
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderEnum', () {
      final a = RenderEnum(
        snakeName: 'a',
        pointer: const JsonPointer.empty(),
        description: 'Foo',
        names: const ['a', 'b', 'c'],
        values: const ['a', 'b', 'c'],
      );
      expect(a.equalsIgnoringName(a), isTrue);

      final b = RenderEnum(
        snakeName: 'b',
        pointer: const JsonPointer.empty(),
        description: 'Foo',
        names: const ['a', 'b', 'c'],
        values: const ['a', 'b', 'c'],
      );
      expect(a.equalsIgnoringName(b), isTrue);

      final c = RenderEnum(
        snakeName: 'a',
        pointer: const JsonPointer.empty(),
        description: 'Foo',
        names: const ['a', 'b'],
        values: const ['a', 'b'],
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderOneOf', () {
      const a = RenderOneOf(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        schemas: [
          RenderPod(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            type: PodType.boolean,
            description: 'Foo',
          ),
        ],
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderOneOf(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        schemas: [
          RenderPod(
            snakeName: 'b',
            pointer: JsonPointer.empty(),
            type: PodType.boolean,
            description: 'Foo',
          ),
        ],
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderOneOf(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        schemas: [
          RenderPod(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            type: PodType.boolean,
            description: 'Foo',
          ),
          RenderPod(
            snakeName: 'b',
            pointer: JsonPointer.empty(),
            type: PodType.boolean,
            description: 'Foo',
          ),
        ],
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });
  });
}
