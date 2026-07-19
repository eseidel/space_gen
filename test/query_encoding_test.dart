import 'package:space_gen/src/query_encoding.dart';
import 'package:space_gen/src/resolver.dart';
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

CommonProperties _common() => const CommonProperties.test(
  snakeName: 'p',
  pointer: JsonPointer.empty(),
);

ResolvedString _string() =>
    ResolvedString(common: _common(), createsNewType: false);

ResolvedInteger _integer() =>
    ResolvedInteger(common: _common(), createsNewType: false);

ResolvedArray _array(ResolvedSchema items) =>
    ResolvedArray(common: _common(), items: items, createsNewType: false);

ResolvedObject _object() => ResolvedObject(
  common: _common(),
  properties: const {},
  requiredProperties: const [],
  additionalProperties: null,
  constProperties: const {},
);

ResolvedOneOf _oneOf(List<ResolvedSchema> schemas) =>
    ResolvedOneOf(common: _common(), schemas: schemas, discriminator: null);

ResolvedAnyOf _anyOf(List<ResolvedSchema> schemas) =>
    ResolvedAnyOf(common: _common(), schemas: schemas, discriminator: null);

void main() {
  group('decideQueryEncoding', () {
    test('a single value encodes as one value', () {
      expect(
        decideQueryEncoding(_string(), explode: true),
        isA<SingleValueEncoding>(),
      );
    });

    test('explode picks between repeated key and comma-joined', () {
      expect(
        decideQueryEncoding(_array(_string()), explode: true),
        isA<RepeatedKeyEncoding>(),
      );
      expect(
        decideQueryEncoding(_array(_string()), explode: false),
        isA<CommaJoinedEncoding>(),
      );
    });

    test('an object has no form encoding', () {
      expect(
        decideQueryEncoding(_object(), explode: true),
        isA<UnsupportedEncoding>(),
      );
    });

    test('an array of arrays has no form encoding', () {
      expect(
        decideQueryEncoding(_array(_array(_string())), explode: true),
        isA<UnsupportedEncoding>(),
      );
    });

    // github's `cwes`: `?k=a` or `?k=a&k=b` depending on the variant held.
    test('a union mixing arities defers to the variant', () {
      final encoding = decideQueryEncoding(
        _oneOf([_string(), _array(_string())]),
        explode: true,
      );
      expect(encoding, isA<PerVariantEncoding>());
      expect(
        (encoding as PerVariantEncoding).variants,
        [isA<SingleValueEncoding>(), isA<RepeatedKeyEncoding>()],
      );
    });

    // The regression #296 was filed for: every variant is an array, so the
    // union is not arity-*mixed* — the shape the old render-side predicate
    // looked for. It still needs per-variant treatment, and answering
    // `SingleValue` here is what produced `?k=[a, b]` with no warning.
    test('a union of arrays is per-variant, not a single value', () {
      final encoding = decideQueryEncoding(
        _oneOf([_array(_string()), _array(_integer())]),
        explode: true,
      );
      expect(encoding, isA<PerVariantEncoding>());
      expect(
        (encoding as PerVariantEncoding).variants,
        everyElement(isA<RepeatedKeyEncoding>()),
      );
    });

    // discord's `oneOf: [enum, enum]`. The arm changes which value goes on
    // the wire, not how many — so this collapses rather than asking the
    // renderer to switch over arms that all produce the same shape.
    test('a union of single values collapses to a single value', () {
      expect(
        decideQueryEncoding(_oneOf([_string(), _integer()]), explode: true),
        isA<SingleValueEncoding>(),
      );
    });

    // spacetraders' `traits` is an `anyOf` in this position.
    test('anyOf is treated as a union too', () {
      expect(
        decideQueryEncoding(
          _anyOf([_string(), _array(_string())]),
          explode: true,
        ),
        isA<PerVariantEncoding>(),
      );
    });

    test('a union with an object variant has no form encoding', () {
      expect(
        decideQueryEncoding(_oneOf([_string(), _object()]), explode: true),
        isA<UnsupportedEncoding>(),
      );
    });

    // Variants are decided one level deep: a variant that is itself a union
    // has no single wire form for its arm to emit.
    test('a union nested in a union has no form encoding', () {
      expect(
        decideQueryEncoding(
          _oneOf([
            _string(),
            _oneOf([_string(), _integer()]),
          ]),
          explode: true,
        ),
        isA<UnsupportedEncoding>(),
      );
    });
  });
}
