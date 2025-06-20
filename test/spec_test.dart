import 'package:space_gen/src/spec.dart';
import 'package:test/test.dart';

void main() {
  group('RefOr', () {
    test('equality', () {
      final bodyOne = RequestBody(
        pointer: JsonPointer.parse('#/components/requestBodies/Foo'),
        description: 'Foo',
        content: const {
          'application/json': MediaType(
            schema: SchemaRef.ref('#/components/schemas/Foo'),
          ),
        },
        isRequired: true,
      );
      final bodyTwo = RequestBody(
        pointer: JsonPointer.parse('#/components/requestBodies/Foo'),
        description: 'Foo',
        content: const {
          'application/json': MediaType(
            schema: SchemaRef.ref('#/components/schemas/Foo'),
          ),
        },
        isRequired: true,
      );
      final refOrOne = RefOr.object(bodyOne);
      final refOrTwo = RefOr.object(bodyTwo);
      final refOrThree = RefOr.object(
        RequestBody(
          pointer: JsonPointer.parse('#/components/requestBodies/Bar'),
          description: 'Bar',
          content: const {
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
