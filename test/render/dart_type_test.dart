import 'package:space_gen/src/render/dart_type.dart';
import 'package:test/test.dart';

void main() {
  group('DartType', () {
    test('renders name, type arguments, and nullability', () {
      expect(const DartType('String').toString(), 'String');
      expect(const DartType('String', isNullable: true).toString(), 'String?');
      expect(
        const DartType('List', typeArguments: [DartType('int')]).toString(),
        'List<int>',
      );
      expect(
        const DartType(
          'Map',
          typeArguments: [DartType('String'), DartType('int')],
          isNullable: true,
        ).toString(),
        'Map<String, int>?',
      );
    });

    test('well-known type constants render as expected', () {
      expect(DartType.dynamic_.toString(), 'dynamic');
      expect(DartType.nullableObject.toString(), 'Object?');
      expect(DartType.void_.toString(), 'void');
      expect(DartType.uint8List.toString(), 'Uint8List');
    });

    test('dynamic never renders a trailing `?`', () {
      // `dynamic` is already nullable; `dynamic?` is a lint.
      expect(DartType.dynamic_.toString(), 'dynamic');
      expect(DartType.dynamic_.asNullable().toString(), 'dynamic');
    });

    test(
      'asNullable / asNonNullable toggle nullability, preserve the rest',
      () {
        const list = DartType('List', typeArguments: [DartType('int')]);
        expect(list.asNullable().toString(), 'List<int>?');
        expect(list.asNullable().asNonNullable(), list);
        expect(list.asNonNullable(), same(list));
      },
    );

    test('equality is structural', () {
      expect(
        const DartType('List', typeArguments: [DartType('int')]),
        const DartType('List', typeArguments: [DartType('int')]),
      );
      expect(
        const DartType('List', typeArguments: [DartType('int')]),
        isNot(const DartType('List', typeArguments: [DartType('String')])),
      );
    });

    group('commonType', () {
      test('single shared base type -> that type', () {
        expect(
          DartType.commonType([const DartType('String')]),
          const DartType('String'),
        );
        expect(
          DartType.commonType([
            const DartType('String'),
            const DartType('String'),
          ]),
          const DartType('String'),
        );
      });

      test('any nullable input makes the result nullable', () {
        expect(
          DartType.commonType([
            const DartType('String'),
            const DartType('String', isNullable: true),
          ]),
          const DartType('String', isNullable: true),
        );
      });

      test('mixed base types -> Object?', () {
        expect(
          DartType.commonType([
            const DartType('String'),
            const DartType('int'),
          ]),
          DartType.nullableObject,
        );
      });

      test('dynamic / Object bases collapse to Object?', () {
        expect(
          DartType.commonType([DartType.dynamic_, DartType.dynamic_]),
          DartType.nullableObject,
        );
        expect(
          DartType.commonType([DartType.dynamic_, const DartType('String')]),
          DartType.nullableObject,
        );
        expect(
          DartType.commonType([
            const DartType('Object'),
            const DartType('Object'),
          ]),
          DartType.nullableObject,
        );
      });

      test('empty set -> Object?', () {
        expect(DartType.commonType(const []), DartType.nullableObject);
      });
    });
  });
}
