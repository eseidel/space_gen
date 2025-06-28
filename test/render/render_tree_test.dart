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
            type: PodType.string,
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
          type: PodType.string,
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
          type: PodType.boolean,
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
            type: PodType.string,
            description: 'Foo',
          ),
        },
      );
      expect(d.equalsIgnoringName(h), isFalse);
    });

    test('RenderArray', () {
      const a = RenderArray(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        description: 'Foo',
        items: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.string,
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
          type: PodType.string,
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
          type: PodType.boolean,
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
            type: PodType.string,
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
            type: PodType.string,
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
            type: PodType.string,
            description: 'Foo',
          ),
          RenderPod(
            snakeName: 'b',
            pointer: JsonPointer.empty(),
            type: PodType.string,
            description: 'Foo',
          ),
        ],
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });
  });
}
