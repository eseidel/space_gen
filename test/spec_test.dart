import 'package:space_gen/src/spec.dart';
import 'package:test/test.dart';

void main() {
  group('RefOr', () {
    test('equality', () {
      const bodyOne = RequestBody(
        pointer: '#/components/requestBodies/Foo',
        description: 'Foo',
        content: {
          'application/json': MediaType(
            schema: SchemaRef.ref('#/components/schemas/Foo'),
          ),
        },
        isRequired: true,
      );
      const bodyTwo = RequestBody(
        pointer: '#/components/requestBodies/Foo',
        description: 'Foo',
        content: {
          'application/json': MediaType(
            schema: SchemaRef.ref('#/components/schemas/Foo'),
          ),
        },
        isRequired: true,
      );
      const refOrOne = RefOr.object(bodyOne);
      const refOrTwo = RefOr.object(bodyTwo);
      const refOrThree = RefOr.object(
        RequestBody(
          pointer: '#/components/requestBodies/Bar',
          description: 'Bar',
          content: {
            'application/json': MediaType(
              schema: SchemaRef.ref('#/components/schemas/Bar'),
            ),
          },
          isRequired: true,
        ),
      );
      expect(refOrOne, refOrTwo);
      expect(refOrOne, isNot(refOrThree));
      expect(refOrOne.hashCode, refOrTwo.hashCode);
      expect(refOrOne.hashCode, isNot(refOrThree.hashCode));
    });
  });
}
