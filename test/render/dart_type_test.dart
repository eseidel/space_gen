import 'package:space_gen/src/render/dart_type.dart';
import 'package:test/test.dart';

void main() {
  group('DartType', () {
    // `Foo` / `Bar` are used for the generic constructor/equality/commonType
    // tests so they exercise the constructor rather than a named constant
    // (which the `use_named_constants` lint would otherwise require).
    test('renders name, type arguments, and nullability', () {
      expect(const DartType('Foo').toString(), 'Foo');
      expect(const DartType('Foo', isNullable: true).toString(), 'Foo?');
      expect(
        const DartType('List', typeArguments: [DartType('Bar')]).toString(),
        'List<Bar>',
      );
      expect(
        const DartType(
          'Map',
          typeArguments: [DartType('Foo'), DartType('Bar')],
          isNullable: true,
        ).toString(),
        'Map<Foo, Bar>?',
      );
    });

    test('well-known type constants render as expected', () {
      expect(DartType.dynamic_.toString(), 'dynamic');
      expect(DartType.nullableObject.toString(), 'Object?');
      expect(DartType.void_.toString(), 'void');
      expect(DartType.uint8List.toString(), 'Uint8List');
      expect(DartType.string.toString(), 'String');
      expect(DartType.bool_.toString(), 'bool');
      expect(DartType.int_.toString(), 'int');
      expect(DartType.double_.toString(), 'double');
      expect(DartType.num_.toString(), 'num');
    });

    test('DartType.list builds List<T>, defaulting the element to dynamic', () {
      expect(DartType.list(DartType.string).toString(), 'List<String>');
      expect(DartType.list().toString(), 'List');
      expect(
        DartType.list(DartType.list(DartType.int_)).toString(),
        'List<List<int>>',
      );
    });

    test('DartType.map builds Map<K, V>', () {
      expect(
        DartType.map(DartType.string, DartType.dynamic_).toString(),
        'Map<String, dynamic>',
      );
      expect(
        DartType.map(DartType.string, DartType.int_).toString(),
        'Map<String, int>',
      );
    });

    test('dynamic never renders a trailing `?`', () {
      // `dynamic` is already nullable; `dynamic?` is a lint.
      expect(DartType.dynamic_.toString(), 'dynamic');
      expect(DartType.dynamic_.asNullable().toString(), 'dynamic');
    });

    test(
      'asNullable / asNonNullable toggle nullability, preserve the rest',
      () {
        const list = DartType('List', typeArguments: [DartType('Foo')]);
        expect(list.asNullable().toString(), 'List<Foo>?');
        expect(list.asNullable().asNonNullable(), list);
        expect(list.asNonNullable(), same(list));
      },
    );

    test('equality is structural', () {
      expect(
        const DartType('List', typeArguments: [DartType('Foo')]),
        const DartType('List', typeArguments: [DartType('Foo')]),
      );
      expect(
        const DartType('List', typeArguments: [DartType('Foo')]),
        isNot(const DartType('List', typeArguments: [DartType('Bar')])),
      );
    });

    group('commonType', () {
      test('single shared base type -> that type', () {
        expect(
          DartType.commonType([const DartType('Foo')]),
          const DartType('Foo'),
        );
        expect(
          DartType.commonType([const DartType('Foo'), const DartType('Foo')]),
          const DartType('Foo'),
        );
      });

      test('any nullable input makes the result nullable', () {
        expect(
          DartType.commonType([
            const DartType('Foo'),
            const DartType('Foo', isNullable: true),
          ]),
          const DartType('Foo', isNullable: true),
        );
      });

      test('mixed base types -> Object?', () {
        expect(
          DartType.commonType([const DartType('Foo'), const DartType('Bar')]),
          DartType.nullableObject,
        );
      });

      test('dynamic / Object bases collapse to Object?', () {
        expect(
          DartType.commonType([DartType.dynamic_, DartType.dynamic_]),
          DartType.nullableObject,
        );
        expect(
          DartType.commonType([DartType.dynamic_, const DartType('Foo')]),
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
