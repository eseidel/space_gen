/// Decides how a query parameter's value is placed on the wire. Operates
/// on the resolved tree only — no Dart names, no template contexts. The
/// renderer consumes a [QueryEncoding] and writes the Dart that produces
/// that wire form.
///
/// The wire form of a query parameter is a spec-level question: `?k=a&k=b`
/// versus `?k=a,b` follows from the schema shape and `explode`, and has
/// nothing to say about Dart. Keeping the decision here rather than in the
/// renderer is what lets one answer drive both the "we're dropping spec
/// semantics" warning and the emitted code.
///
/// Deliberately *not* in scope: whether the renderer can currently express
/// a given decision. That is a capability question, not a semantic one —
/// see the note on [PerVariantEncoding]. Conflating the two is what let a
/// union of arrays render as Dart's `List.toString()` with no warning
/// (#296).
library;

import 'package:space_gen/src/resolver.dart';

/// How a query parameter's value is serialized under `style: form` — the
/// only style the generator emits (#100 tracks the others).
///
/// Subclass names carry the `Encoding` suffix for the same reason
/// `DispatchDecision`'s carry `Dispatch`: they are top-level names in a
/// small vocabulary that would otherwise collide with common words.
sealed class QueryEncoding {
  const QueryEncoding();
}

/// `?k=v` — the value serializes to exactly one wire value.
///
/// Also the answer for a union whose every variant is itself a single
/// value (discord's `oneOf: [enum, enum]`): the arm held at the call site
/// changes which value goes on the wire, not how many.
class SingleValueEncoding extends QueryEncoding {
  const SingleValueEncoding();
}

/// `?k=a&k=b` — an array repeated across the key (`explode: true`).
class RepeatedKeyEncoding extends QueryEncoding {
  const RepeatedKeyEncoding();
}

/// `?k=a,b` — an array comma-joined into one value (`explode: false`).
class CommaJoinedEncoding extends QueryEncoding {
  const CommaJoinedEncoding();
}

/// A union whose variants disagree on arity, so the variant held at the
/// call site picks the wire form. github's `cwes` is
/// `oneOf: [string, array<string>]`: `?k=a` or `?k=a&k=b`.
///
/// [variants] is parallel to the union's `schemas`, one encoding each,
/// and never contains a [PerVariantEncoding] — variants are decided one
/// level deep, since a variant that is itself a union has no single form
/// for its arm to emit.
///
/// The renderer may find it cannot emit this (a variant with no wrapper
/// subclass to destructure). That is a renderer limitation, not a
/// different decision: it warns and falls back, rather than quietly
/// pretending the shape was [SingleValueEncoding].
class PerVariantEncoding extends QueryEncoding {
  const PerVariantEncoding(this.variants);

  /// One encoding per union variant, in declaration order.
  final List<QueryEncoding> variants;
}

/// No wire form this generator knows how to produce — object shapes, and
/// arrays of arrays.
///
/// `form`/`deepObject` object serialization isn't implemented and no spec
/// in the validation rotation uses it, so rather than guess at a wire
/// format the caller warns and the renderer stringifies. The warning is
/// the record that we're dropping spec semantics; implement the real
/// encoding when a spec needs it.
class UnsupportedEncoding extends QueryEncoding {
  const UnsupportedEncoding();
}

/// True when [schema] serializes to a single value on the wire — the shape
/// a parameter may take on its own, and the element type an array-shaped
/// one may hold.
///
/// Shared with the resolver's path-parameter rule, which is this set minus
/// `ResolvedNumber`: `?ratio=0.5` is a fine query value, but we don't want
/// one in a URL path segment. Expressing that rule as "this, minus number"
/// is what keeps the two from drifting.
///
/// `_isMultipartScalar` in `render/render_tree.dart` asks the same question
/// over `Render*`, for a multipart body's text fields. That one can't share
/// this implementation — it runs after the Dart types exist and has to let
/// the file-part branch claim `RenderBinary` first — so the two are held in
/// step by hand. Change both or neither.
bool isSingleWireValue(ResolvedSchema schema) {
  if (schema is ResolvedString ||
      schema is ResolvedInteger ||
      schema is ResolvedNumber ||
      schema is ResolvedEnum) {
    return true;
  }
  // Pods (uuid, email, date-time, uri, uri-template, boolean) and `Date` all
  // serialize to a single string on the wire via their `toJson`.
  return schema is ResolvedPod || schema is ResolvedDate;
}

/// The wire form for a query parameter of [schema] with the effective
/// [explode].
QueryEncoding decideQueryEncoding(
  ResolvedSchema schema, {
  required bool explode,
}) {
  final direct = _arityEncoding(schema, explode: explode);
  if (direct != null) {
    return direct;
  }
  // `anyOf` as well as `oneOf`: both render as a sealed union (anyOf becomes
  // a `RenderOneOf`), and both appear in this position in the wild —
  // spacetraders' `traits` is an `anyOf`. `allOf` is a
  // [ResolvedSchemaCollection] too, but it intersects rather than unions its
  // members, so it is deliberately not accepted here.
  final variants = switch (schema) {
    ResolvedOneOf(:final schemas) => schemas,
    ResolvedAnyOf(:final schemas) => schemas,
    _ => null,
  };
  if (variants == null || variants.isEmpty) {
    return const UnsupportedEncoding();
  }
  // Variants are decided one level deep. A variant that is itself a union
  // has no single wire form, so there is nothing for its arm to emit.
  final encodings = <QueryEncoding>[];
  for (final variant in variants) {
    final encoding = _arityEncoding(variant, explode: explode);
    if (encoding == null) {
      return const UnsupportedEncoding();
    }
    encodings.add(encoding);
  }
  // Every variant is a single value, so the union is too — the arm changes
  // which value goes on the wire, not how many. Collapsing here keeps these
  // unions on the renderer's simple path instead of asking it to switch
  // over arms that would all produce the same shape.
  if (encodings.every((e) => e is SingleValueEncoding)) {
    return const SingleValueEncoding();
  }
  return PerVariantEncoding(encodings);
}

/// [schema]'s encoding when it is a single value or an array of them —
/// null when it is neither, which is the caller's cue to try the union
/// shapes (or give up).
QueryEncoding? _arityEncoding(
  ResolvedSchema schema, {
  required bool explode,
}) {
  if (isSingleWireValue(schema)) {
    return const SingleValueEncoding();
  }
  if (schema is ResolvedArray && isSingleWireValue(schema.items)) {
    // Nested arrays fall out here rather than being special-cased: an
    // array whose items are an array has no `form` wire encoding.
    return explode ? const RepeatedKeyEncoding() : const CommaJoinedEncoding();
  }
  return null;
}
