import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

void main() {
  group('equalsIgnoringName', () {
    test('RenderObject', () {
      const a = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{},
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderObject(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{},
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{
          'a': RenderUnknown(snakeName: 'a', pointer: JsonPointer.empty()),
        },
      );
      expect(a.equalsIgnoringName(c), isFalse);

      const d = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{
          'a': RenderPod(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            type: PodType.string,
          ),
        },
      );
      expect(a.equalsIgnoringName(d), isFalse);

      const e = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{},
        additionalProperties: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.string,
        ),
      );
      expect(a.equalsIgnoringName(e), isFalse);

      const f = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{},
        required: ['a'],
      );
      expect(a.equalsIgnoringName(f), isFalse);

      const g = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{},
        additionalProperties: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.boolean,
        ),
      );
      expect(e.equalsIgnoringName(g), isFalse);

      const h = RenderObject(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        properties: <String, RenderSchema>{
          'e': RenderPod(
            snakeName: 'e',
            pointer: JsonPointer.empty(),
            type: PodType.string,
          ),
        },
      );
      expect(d.equalsIgnoringName(h), isFalse);
    });

    test('RenderArray', () {
      const a = RenderArray(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        items: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.string,
        ),
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderArray(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        items: RenderPod(
          snakeName: 'b',
          pointer: JsonPointer.empty(),
          type: PodType.string,
        ),
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderArray(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        items: RenderPod(
          snakeName: 'a',
          pointer: JsonPointer.empty(),
          type: PodType.boolean,
        ),
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderEnum', () {
      const a = RenderEnum(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        values: ['a', 'b', 'c'],
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderEnum(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        values: ['a', 'b', 'c'],
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderEnum(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        values: ['a', 'b'],
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });

    test('RenderOneOf', () {
      const a = RenderOneOf(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        schemas: [
          RenderPod(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            type: PodType.string,
          ),
        ],
      );
      expect(a.equalsIgnoringName(a), isTrue);

      const b = RenderOneOf(
        snakeName: 'b',
        pointer: JsonPointer.empty(),
        schemas: [
          RenderPod(
            snakeName: 'b',
            pointer: JsonPointer.empty(),
            type: PodType.string,
          ),
        ],
      );
      expect(a.equalsIgnoringName(b), isTrue);

      const c = RenderOneOf(
        snakeName: 'a',
        pointer: JsonPointer.empty(),
        schemas: [
          RenderPod(
            snakeName: 'a',
            pointer: JsonPointer.empty(),
            type: PodType.string,
          ),
          RenderPod(
            snakeName: 'b',
            pointer: JsonPointer.empty(),
            type: PodType.string,
          ),
        ],
      );
      expect(a.equalsIgnoringName(c), isFalse);
    });
  });
}
