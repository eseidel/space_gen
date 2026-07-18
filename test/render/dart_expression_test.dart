import 'package:space_gen/src/render/dart_expression.dart';
import 'package:space_gen/src/render/dart_type.dart';
import 'package:test/test.dart';

/// A non-constant expression to nest as an argument: `Uri.parse` computes
/// at runtime.
const nonConst = DartInvocation.runtime(
  type: DartType.uri,
  constructorName: 'parse',
  arguments: [DartLiteral('https://example.com')],
);

void main() {
  group('DartLiteral', () {
    test('strings quote and escape through quoteString', () {
      expect(const DartLiteral('example').toString(), "'example'");
      expect(const DartLiteral(r"it's $x").toString(), r"'it\'s \$x'");
      expect(const DartLiteral('a\nb').toString(), r"'a\nb'");
    });

    test('numbers keep the int/double distinction', () {
      expect(const DartLiteral(5).toString(), '5');
      expect(const DartLiteral(5.0).toString(), '5.0');
      expect(const DartLiteral(-5).toString(), '-5');
    });

    test('bool and null render bare', () {
      expect(const DartLiteral(false).toString(), 'false');
      expect(const DartLiteral(null).toString(), 'null');
    });

    test('is always constant', () {
      expect(const DartLiteral(5).isConst, isTrue);
      expect(const DartLiteral(null).isConst, isTrue);
    });

    test('equality is by value', () {
      expect(const DartLiteral(5), const DartLiteral(5));
      // `5` and `5.0` render differently, so they are different literals.
      expect(const DartLiteral(5), isNot(const DartLiteral(5.0)));
    });
  });

  group('DartListLiteral', () {
    test('always writes its element type', () {
      expect(
        const DartListLiteral(
          elementType: DartType.int_,
          elements: [DartLiteral(0), DartLiteral(1)],
        ).toString(),
        '<int>[0, 1]',
      );
      expect(
        const DartListLiteral(
          elementType: DartType.string,
          elements: [],
        ).toString(),
        '<String>[]',
      );
    });

    test('equality is by value', () {
      // Built from a non-const local so this is a distinct object:
      // identical `const` instances are canonicalized to one, and `==`
      // would then short-circuit on identity without reaching `props`.
      final elements = [const DartLiteral(0)];
      expect(
        DartListLiteral(elementType: DartType.int_, elements: elements),
        const DartListLiteral(
          elementType: DartType.int_,
          elements: [DartLiteral(0)],
        ),
      );
      expect(
        DartListLiteral(elementType: DartType.int_, elements: elements),
        isNot(
          const DartListLiteral(
            elementType: DartType.num_,
            elements: [DartLiteral(0)],
          ),
        ),
      );
    });

    test('is constant only when every element is', () {
      expect(
        const DartListLiteral(
          elementType: DartType.int_,
          elements: [DartLiteral(0)],
        ).isConst,
        isTrue,
      );
      expect(
        const DartListLiteral(
          elementType: DartType.uri,
          elements: [nonConst],
        ).isConst,
        isFalse,
      );
    });
  });

  group('DartMapLiteral', () {
    test('untyped omits the type arguments', () {
      expect(
        const DartMapLiteral.untyped([
          DartMapEntry(DartLiteral('key'), DartLiteral('example')),
        ]).toString(),
        "{'key': 'example'}",
      );
    });

    test('writes type arguments when present', () {
      expect(
        const DartMapLiteral(
          keyType: DartType.string,
          valueType: DartType.dynamic_,
        ).toString(),
        '<String, dynamic>{}',
      );
    });

    test('is constant only when every key and value is', () {
      expect(
        const DartMapLiteral(
          keyType: null,
          valueType: null,
          entries: [DartMapEntry(DartLiteral('key'), DartLiteral(1))],
        ).isConst,
        isTrue,
      );
      expect(
        const DartMapLiteral(
          keyType: null,
          valueType: null,
          entries: [DartMapEntry(DartLiteral('key'), nonConst)],
        ).isConst,
        isFalse,
      );
    });

    test('entries are values with their own rendering', () {
      // Deliberately not `const`: identical const instances are
      // canonicalized to one object, so `==` would short-circuit on
      // identity and never exercise value equality.
      // ignore: prefer_const_constructors
      final entry = DartMapEntry(DartLiteral('k'), DartLiteral(1));
      expect(entry, const DartMapEntry(DartLiteral('k'), DartLiteral(1)));
      expect(
        const DartMapEntry(DartLiteral('k'), DartLiteral(1)).toString(),
        "'k': 1",
      );
    });

    test('equality is by value, including the type arguments', () {
      // See the list-literal equality test for why this is a non-const
      // local.
      final entries = <DartMapEntry>[];
      expect(
        DartMapLiteral(
          keyType: DartType.string,
          valueType: DartType.dynamic_,
          entries: entries,
        ),
        const DartMapLiteral(
          keyType: DartType.string,
          valueType: DartType.dynamic_,
        ),
      );
      // `{}` and `<String, dynamic>{}` render differently.
      expect(
        DartMapLiteral(
          keyType: DartType.string,
          valueType: DartType.dynamic_,
          entries: entries,
        ),
        isNot(
          const DartMapLiteral(keyType: null, valueType: null),
        ),
      );
    });
  });

  group('DartInvocation', () {
    test('renders unnamed, named, and mixed argument forms', () {
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          isConstConstructor: true,
        ).toString(),
        'Foo()',
      );
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          constructorName: 'named',
          arguments: [DartLiteral(1)],
          namedArguments: {'b': DartLiteral(2)},
          isConstConstructor: true,
        ).toString(),
        'Foo.named(1, b: 2)',
      );
    });

    test('named arguments render in insertion order', () {
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          namedArguments: {'b': DartLiteral(1), 'a': DartLiteral(2)},
          isConstConstructor: true,
        ).toString(),
        'Foo(b: 1, a: 2)',
      );
    });

    test('a non-const constructor is never a constant', () {
      // All arguments constant, but the constructor is not — e.g. a
      // validating newtype, whose generated constructor has a body.
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          arguments: [DartLiteral(1)],
          isConstConstructor: false,
        ).isConst,
        isFalse,
      );
      // `.runtime` is the same fact, spelled as the category it names.
      expect(
        const DartInvocation.runtime(
          type: DartType('Foo'),
          arguments: [DartLiteral(1)],
        ),
        const DartInvocation(
          type: DartType('Foo'),
          arguments: [DartLiteral(1)],
          isConstConstructor: false,
        ),
      );
    });

    test('a non-const argument makes the whole invocation non-const', () {
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          arguments: [nonConst],
          isConstConstructor: true,
        ).isConst,
        isFalse,
      );
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          namedArguments: {'a': nonConst},
          isConstConstructor: true,
        ).isConst,
        isFalse,
      );
    });

    test('const constructor with all-const arguments is constant', () {
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          arguments: [DartLiteral(1)],
          namedArguments: {'b': DartLiteral('x')},
          isConstConstructor: true,
        ).isConst,
        isTrue,
      );
    });

    test('nesting propagates non-const-ness up the tree', () {
      // `Foo(Bar(Uri.parse(...)))`: every constructor is const, but the
      // leaf is not, so nothing above it is either. This is the case
      // `package:code_builder` gets wrong (it would emit an invalid
      // `const Foo(...)`); see doc/dart_expression.md.
      const inner = DartInvocation(
        type: DartType('Bar'),
        arguments: [nonConst],
        isConstConstructor: true,
      );
      const outer = DartInvocation(
        type: DartType('Foo'),
        arguments: [inner],
        isConstConstructor: true,
      );
      expect(outer.isConst, isFalse);
      expect(outer.toString(), "Foo(Bar(Uri.parse('https://example.com')))");
    });

    test('equality is by value, including const-ness of the constructor', () {
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          arguments: [DartLiteral(1)],
          isConstConstructor: true,
        ),
        isNot(
          const DartInvocation(
            type: DartType('Foo'),
            arguments: [DartLiteral(1)],
            isConstConstructor: false,
          ),
        ),
      );
    });
  });

  group('DartTypeExpressions', () {
    test('construct builds a const-constructor invocation', () {
      expect(
        const DartType('Foo').construct(),
        const DartInvocation(type: DartType('Foo'), isConstConstructor: true),
      );
      expect(
        const DartType(
              'Foo',
            )
            .construct(name: 'named', arguments: const [DartLiteral(1)])
            .toString(),
        'Foo.named(1)',
      );
      // The point of `construct` vs `constructAtRuntime`: const-ness.
      expect(
        const DartType(
          'Foo',
        ).construct(arguments: const [DartLiteral(1)]).isConst,
        isTrue,
      );
    });

    test('constructAtRuntime is never constant', () {
      final parse = DartType.uri.constructAtRuntime(
        name: 'parse',
        arguments: const [DartLiteral('https://example.com')],
      );
      expect(parse.toString(), "Uri.parse('https://example.com')");
      expect(parse.isConst, isFalse);
    });

    test('listOf and member build the collection and reference forms', () {
      expect(
        DartType.int_.listOf(const [DartLiteral(0)]).toString(),
        '<int>[0]',
      );
      expect(const DartType('Foo').member('a').toString(), 'Foo.a');
    });
  });

  group('DartStaticMember', () {
    test('renders as a member reference and is constant', () {
      const member = DartStaticMember(type: DartType('Foo'), name: 'a');
      expect(member.toString(), 'Foo.a');
      expect(member.isConst, isTrue);
      expect(member, const DartStaticMember(type: DartType('Foo'), name: 'a'));
    });
  });
}
