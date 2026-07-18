import 'package:space_gen/src/render/dart_expression.dart';
import 'package:space_gen/src/render/dart_type.dart';
import 'package:test/test.dart';

import 'expression_source.dart';

/// A non-constant expression to nest as an argument: `Uri.parse` computes
/// at runtime.
const nonConst = DartInvocation(
  type: DartType.uri,
  constructorName: 'parse',
  arguments: [DartLiteral('https://example.com')],
  isConstConstructor: false,
);

void main() {
  group('DartLiteral', () {
    test('strings quote and escape through quoteString', () {
      expect(const DartLiteral('example').source, "'example'");
      expect(const DartLiteral(r"it's $x").source, r"'it\'s \$x'");
      expect(const DartLiteral('a\nb').source, r"'a\nb'");
    });

    test('numbers keep the int/double distinction', () {
      expect(const DartLiteral(5).source, '5');
      expect(const DartLiteral(5.0).source, '5.0');
      expect(const DartLiteral(-5).source, '-5');
    });

    test('bool and null render bare', () {
      expect(const DartLiteral(false).source, 'false');
      expect(const DartLiteral(null).source, 'null');
    });

    test('is always constant', () {
      expect(const DartLiteral(5).canBeConst, isTrue);
      expect(const DartLiteral(null).canBeConst, isTrue);
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
        ).source,
        '<int>[0, 1]',
      );
      expect(
        const DartListLiteral(
          elementType: DartType.string,
          elements: [],
        ).source,
        '<String>[]',
      );
    });

    test('untyped omits the type argument', () {
      expect(DartListLiteral.empty.source, '[]');
      expect(
        const DartListLiteral.untyped([DartLiteral(0)]).source,
        '[0]',
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
        ).canBeConst,
        isTrue,
      );
      expect(
        const DartListLiteral(
          elementType: DartType.uri,
          elements: [nonConst],
        ).canBeConst,
        isFalse,
      );
    });
  });

  group('DartMapLiteral', () {
    test('untyped omits the type arguments', () {
      expect(
        const DartMapLiteral.untyped([
          DartMapEntry(DartLiteral('key'), DartLiteral('example')),
        ]).source,
        "{'key': 'example'}",
      );
    });

    test('writes type arguments when present', () {
      expect(
        const DartMapLiteral(
          keyType: DartType.string,
          valueType: DartType.dynamic_,
        ).source,
        '<String, dynamic>{}',
      );
    });

    test('is constant only when every key and value is', () {
      expect(
        const DartMapLiteral(
          keyType: null,
          valueType: null,
          entries: [DartMapEntry(DartLiteral('key'), DartLiteral(1))],
        ).canBeConst,
        isTrue,
      );
      expect(
        const DartMapLiteral(
          keyType: null,
          valueType: null,
          entries: [DartMapEntry(DartLiteral('key'), nonConst)],
        ).canBeConst,
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
      // Entries render as part of their map, not standalone.
      expect(
        const DartMapLiteral.untyped([
          DartMapEntry(DartLiteral('k'), DartLiteral(1)),
        ]).source,
        "{'k': 1}",
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
        ).source,
        'Foo()',
      );
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          constructorName: 'named',
          arguments: [DartLiteral(1)],
          namedArguments: {'b': DartLiteral(2)},
          isConstConstructor: true,
        ).source,
        'Foo.named(1, b: 2)',
      );
    });

    test('named arguments render in insertion order', () {
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          namedArguments: {'b': DartLiteral(1), 'a': DartLiteral(2)},
          isConstConstructor: true,
        ).source,
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
        ).canBeConst,
        isFalse,
      );
    });

    test('a non-const argument makes the whole invocation non-const', () {
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          arguments: [nonConst],
          isConstConstructor: true,
        ).canBeConst,
        isFalse,
      );
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          namedArguments: {'a': nonConst},
          isConstConstructor: true,
        ).canBeConst,
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
        ).canBeConst,
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
      expect(outer.canBeConst, isFalse);
      expect(outer.source, "Foo(Bar(Uri.parse('https://example.com')))");
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

  group('call and reference nodes', () {
    const value = DartIdentifier('value');

    test('an identifier renders bare and is never constant', () {
      expect(value.source, 'value');
      // A reference to a variable is not a constant expression even when
      // the variable holds one.
      expect(value.canBeConst, isFalse);
    });

    test('a method call renders with and without null-aware access', () {
      expect(
        const DartMethodCall(target: value, name: 'toJson').source,
        'value.toJson()',
      );
      expect(
        const DartMethodCall(
          target: value,
          name: 'toJson',
          isNullAware: true,
        ).source,
        'value?.toJson()',
      );
    });

    test('calls chain by nesting rather than by special support', () {
      // `x.map(f).toList()` is a call whose target is a call.
      const chained = DartMethodCall(
        target: DartMethodCall(
          target: value,
          name: 'map',
          arguments: [
            DartLambda(
              parameters: ['e'],
              body: DartMethodCall(
                target: DartIdentifier('e'),
                name: 'toJson',
              ),
            ),
          ],
          isNullAware: true,
        ),
        name: 'toList',
      );
      expect(chained.source, 'value?.map((e) => e.toJson()).toList()');
      expect(chained.canBeConst, isFalse);
    });

    test('a property access emits no parentheses', () {
      expect(
        const DartPropertyAccess(
          target: DartIdentifier('entry'),
          name: 'value',
        ).source,
        'entry.value',
      );
      expect(
        const DartPropertyAccess(
          target: value,
          name: 'length',
          isNullAware: true,
        ).source,
        'value?.length',
      );
    });

    test('a lambda takes multiple parameters', () {
      expect(
        DartLambda(
          parameters: const ['key', 'value'],
          body: const DartType('MapEntry').construct(const [
            DartIdentifier('key'),
            DartIdentifier('value'),
          ]),
        ).source,
        '(key, value) => MapEntry(key, value)',
      );
    });

    test('a runtime destination adds no keyword to a call', () {
      // Nothing here is constant, so nothing gains `const` even in a
      // runtime context.
      expect(
        const DartMethodCall(target: value, name: 'toJson').runtimeSource,
        'value.toJson()',
      );
    });

    test('equality is by value', () {
      // See the list-literal equality test for why one side is non-const.
      final names = ['entry'];
      final target = DartIdentifier(names.first);
      expect(
        DartPropertyAccess(target: target, name: 'value'),
        const DartPropertyAccess(
          target: DartIdentifier('entry'),
          name: 'value',
        ),
      );
      expect(
        DartLambda(parameters: const ['e'], body: target),
        const DartLambda(parameters: ['e'], body: DartIdentifier('entry')),
      );
      expect(
        const DartMethodCall(target: value, name: 'toJson'),
        isNot(
          const DartMethodCall(
            target: value,
            name: 'toJson',
            isNullAware: true,
          ),
        ),
      );
    });
  });

  group('DartExpressionSerializer', () {
    test('writes the keyword at the outermost node that can carry it', () {
      expect(DartListLiteral.empty.runtimeSource, 'const []');
      expect(
        const DartListLiteral(
          elementType: DartType.int_,
          elements: [DartLiteral(0)],
        ).runtimeSource,
        'const <int>[0]',
      );
      expect(
        const DartMapLiteral(
          keyType: DartType.string,
          valueType: DartType.dynamic_,
        ).runtimeSource,
        'const <String, dynamic>{}',
      );
      expect(
        const DartInvocation(
          type: DartType('Foo'),
          arguments: [DartLiteral(1)],
          isConstConstructor: true,
        ).runtimeSource,
        'const Foo(1)',
      );
    });

    test('renders bare where the keyword is not legal', () {
      // `const 5` and `const UserRole.admin` are syntax errors.
      expect(const DartLiteral(5).runtimeSource, '5');
      expect(
        const DartStaticMember(
          type: DartType('Foo'),
          name: 'a',
        ).runtimeSource,
        'Foo.a',
      );
    });

    test('renders bare when the value is not constant', () {
      expect(nonConst.runtimeSource, "Uri.parse('https://example.com')");
      expect(
        const DartListLiteral(
          elementType: DartType.uri,
          elements: [nonConst],
        ).runtimeSource,
        "<Uri>[Uri.parse('https://example.com')]",
      );
    });

    test('the same tree renders differently per destination', () {
      // The whole reason rendering is not a method on the node.
      expect(DartListLiteral.empty.source, '[]');
      expect(DartListLiteral.empty.runtimeSource, 'const []');
    });

    test('context threads down through nesting', () {
      // A constant subtree inside a non-constant parent gets its own
      // keyword; a constant parent covers everything below it, so nothing
      // inside repeats it (which would be `unnecessary_const`).
      const bytes = DartListLiteral(
        elementType: DartType.int_,
        elements: [DartLiteral(0)],
      );
      expect(
        DartType.uint8List.construct([bytes], name: 'fromList').runtimeSource,
        'Uint8List.fromList(const <int>[0])',
      );
      expect(
        const DartType('Foo').constConstruct([bytes]).runtimeSource,
        'const Foo(<int>[0])',
      );
    });

    test('the two serializers are distinct values', () {
      expect(
        DartExpressionSerializer.constContext,
        isNot(DartExpressionSerializer.runtimeContext),
      );
    });

    test('toString on a node is a debug form, not Dart source', () {
      // Guards against an expression accidentally being interpolated
      // into generated output instead of serialized.
      expect(const DartLiteral(5).toString(), contains('DartLiteral'));
    });
  });

  group('DartTypeExpressions', () {
    test('construct is never constant', () {
      final parse = DartType.uri.construct(const [
        DartLiteral('https://example.com'),
      ], name: 'parse');
      expect(parse.source, "Uri.parse('https://example.com')");
      expect(parse.canBeConst, isFalse);
    });

    test('constConstruct is constant when its arguments are', () {
      expect(
        const DartType('Foo').constConstruct(const []),
        const DartInvocation(type: DartType('Foo'), isConstConstructor: true),
      );
      expect(
        const DartType('Foo').constConstruct(const [DartLiteral(1)]).canBeConst,
        isTrue,
      );
      // ...and not when they aren't: the whole point of the derivation.
      expect(
        const DartType('Foo').constConstruct(const [nonConst]).canBeConst,
        isFalse,
      );
    });

    test('member builds a static reference', () {
      expect(const DartType('Foo').member('a').source, 'Foo.a');
    });
  });

  group('DartStaticMember', () {
    test('renders as a member reference and is constant', () {
      const member = DartStaticMember(type: DartType('Foo'), name: 'a');
      expect(member.source, 'Foo.a');
      expect(member.canBeConst, isTrue);
      expect(member, const DartStaticMember(type: DartType('Foo'), name: 'a'));
    });
  });
}
