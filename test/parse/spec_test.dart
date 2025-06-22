import 'package:space_gen/src/parse/spec.dart';
import 'package:test/test.dart';

void main() {
  group('RefOr', () {
    test('equality', () {
      final bodyOne = RequestBody(
        pointer: JsonPointer.parse('#/components/requestBodies/Foo'),
        description: 'Foo',
        content: const {
          'application/json': MediaType(
            schema: SchemaRef.ref(
              '#/components/schemas/Foo',
              JsonPointer.empty(),
            ),
          ),
        },
        isRequired: true,
      );
      final bodyTwo = RequestBody(
        pointer: JsonPointer.parse('#/components/requestBodies/Foo'),
        description: 'Foo',
        content: const {
          'application/json': MediaType(
            schema: SchemaRef.ref(
              '#/components/schemas/Foo',
              JsonPointer.empty(),
            ),
          ),
        },
        isRequired: true,
      );
      final refOrOne = RefOr.object(bodyOne, const JsonPointer.empty());
      final refOrTwo = RefOr.object(bodyTwo, const JsonPointer.empty());
      final refOrThree = RefOr.object(
        RequestBody(
          pointer: JsonPointer.parse('#/components/requestBodies/Bar'),
          description: 'Bar',
          content: const {
            'application/json': MediaType(
              schema: SchemaRef.ref(
                '#/components/schemas/Bar',
                JsonPointer.empty(),
              ),
            ),
          },
          isRequired: true,
        ),
        const JsonPointer.empty(),
      );
      expect(refOrOne, refOrTwo);
      expect(refOrOne, isNot(refOrThree));
      expect(refOrOne.hashCode, refOrTwo.hashCode);
      expect(refOrOne.hashCode, isNot(refOrThree.hashCode));
    });
  });
}
