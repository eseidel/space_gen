import 'package:space_gen/src/parse/spec.dart';
import 'package:test/test.dart';

void main() {
  group('RefOr', () {
    test('equality', () {
      final bodyOne = RequestBody(
        pointer: JsonPointer.parse('#/components/requestBodies/Foo'),
        description: 'Foo',
        content: {
          'application/json': MediaType(
            schema: SchemaRef.ref(
              '#/components/schemas/Foo',
              const JsonPointer.empty(),
            ),
          ),
        },
        isRequired: true,
      );
      final bodyTwo = RequestBody(
        pointer: JsonPointer.parse('#/components/requestBodies/Foo'),
        description: 'Foo',
        content: {
          'application/json': MediaType(
            schema: SchemaRef.ref(
              '#/components/schemas/Foo',
              const JsonPointer.empty(),
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
          content: {
            'application/json': MediaType(
              schema: SchemaRef.ref(
                '#/components/schemas/Bar',
                const JsonPointer.empty(),
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
