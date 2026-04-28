# Architecture

`space_gen` turns an OpenAPI 3.0/3.1 spec into a Dart client package.
This doc describes the pipeline as it exists today and calls out the
current design questions — especially around external `$ref`s.

## Pipeline at a glance

```
  specUrl
     │
     ▼
┌────────┐ ┌────────┐ ┌──────────┐ ┌──────────┐ ┌────────┐ ┌──────────┐  Dart files
│ Load   │▶│ Parse  │▶│ Resolve  │▶│ Dispatch │▶│ Naming │▶│ Render   │▶
│ (I/O)  │ │ (pure) │ │ (pure)   │ │ (pure)   │ │ (pure) │ │ (pure)   │
└────────┘ └────────┘ └──────────┘ └──────────┘ └────────┘ └──────────┘
                          │                ▲          ▲
                          ▼                │          │
                      ┌──────────┐    sidecar lookups (Decisions, Names)
                      │ Registry │
                      └──────────┘
```

Only **Load** does I/O. Everything downstream is a pure function of its
input — *in principle*. In practice, external `$ref` support has pushed
a bit of I/O up into the phase orchestration (see "Open questions").

The original three downstream phases (Parse / Resolve / Render) are
gradually being split: dispatch decisions and (planned) name
assignment are getting their own phases between Resolve and Render so
they can be made *globally*, with the full set of named entities in
view. The current state lives a single dispatch pass; the naming pass
is on the way (see "Planned phases" below).

## Phase 1 — Load

**Purpose:** fetch raw JSON for the spec (and any imports).
**Lives in:** `lib/src/loader.dart`.
**API:** `Cache(fs)` → `cache.load(Uri) → Future<Json>`. In-memory
memoization; supports `file:` and `http(s)`.

**Current scope:** loads exactly the document(s) the caller asks for.
It does **not** walk refs on its own. The orchestrator asks it for the
root spec, then (today) for any URIs surfaced by the external-ref step.

## Phase 2 — Parse

**Purpose:** turn one JSON document into a typed tree.
**Lives in:** `lib/src/parser.dart` and `lib/src/parse/`.
**Entry point:** `parseOpenApi(Json) → OpenApi` (`lib/src/parser.dart:1222`).

**Output types** (`lib/src/parse/spec.dart`): `OpenApi`, `Paths`,
`PathItem`, `Operation`, `Parameter`, `RequestBody`, `Responses`,
`Response`, `Header`, `Components`, `Schema` (sealed: `SchemaObject`,
`SchemaArray`, `SchemaMap`, `SchemaPod`, `SchemaString`,
`SchemaInteger`, `SchemaNumber`, `SchemaEnum`, …).

**Refs:** every `$ref` site is wrapped in `RefOr<T>` — either an inline
`T` (`object`) or a `Ref<T>` pointing at another location (`ref`). Refs
are **not** dereferenced here; they stay as URIs.

**Pointers:** every `HasPointer` object carries a `JsonPointer` marking
where in the doc it came from. Pointers are used downstream to build
registry keys and to report error locations.

**Context:** parsing is driven by a `MapContext` / `ListContext` that
carries `pointerParts`, `snakeNameStack`, and (recently) `baseUri`.

## Phase 3 — Resolve

**Purpose:** turn the parsed tree with unresolved refs into a fully
resolved, cycle-aware tree ready for code generation.
**Lives in:** `lib/src/resolver.dart`.
**Entry point:** `resolveSpec(OpenApi, specUrl: Uri, refRegistry:?)`
(`lib/src/resolver.dart:753`).
**Output:** `ResolvedSpec` with `ResolvedPath`, `ResolvedOperation`,
`ResolvedSchema`. Refs are gone; recursive targets are preserved via a
`ResolvedRecursiveRef` marker (see `render_tree.dart` doc comments on
`RenderRecursiveRef`).

**RefRegistry** (`lib/src/parser.dart:1261`): a `Map<Uri, dynamic>`
keyed by absolute URI. Populated by `RegistryBuilder`
(`lib/src/resolver.dart:623`), which walks the parsed tree via
`SpecWalker` and registers every `HasPointer`. Queried by
`ResolveContext._resolveUri`.

**Resolution:** `ResolveContext._resolve` looks a `Ref<T>` up by
`specUrl.resolveUri(ref.uri)` — i.e., the registry key is the absolute
URI you get by resolving the ref against the root spec URL.

## Phase 4 — Dispatch

**Purpose:** decide how each polymorphic schema (`oneOf` / `anyOf`)
will route its `fromJson` at runtime. Pure structural — operates on
the resolved tree only, knows nothing about Dart names or per-variant
Dart-string production.
**Lives in:** `lib/src/dispatch.dart`.
**Entry point:** `decideDispatch(ResolvedSchemaCollection)
→ DispatchDecision`.

**Output types:** sealed `DispatchDecision` family — `Discriminator
Dispatch`, `ShapeDispatch`, `HybridDispatch`, `PredicateDispatch`,
`NoDispatch`. Each carries the structural facts the renderer needs
(predicate per arm, shape key per arm, declaration order, etc.) but
references variants as `ResolvedSchema`s rather than by Dart name.

**Why a separate phase:** the dispatch decision determines *which*
wrapper subclasses get emitted for a given oneOf. A future global
naming pass needs to know that wrapper set up front so it can hand
each wrapper a name. Decision-making had to leave the renderer for
that to be possible.

**`Predicate` IR.** Each variant's "is this me?" test is a value:
`KeyExists(prop)`, `ArrayElementHasKey(prop)`, `Always` (the
unguarded fallback). Adding a new way to distinguish variants — e.g.
peeking deeper than one level into JSON — is a new `Predicate`
subtype, not a new dispatch mode.

**Note:** dispatch is consumed only by `RenderOneOf`'s template-
context production today. The renderer still owns Dart-string
production (`wrapperTypeName`, per-variant `fromJson`/`toJson`
expressions); it asks dispatch what the structural decision was and
splices the strings around it.

## Phase 5 — Render

Renders split into two sub-phases:

**5a. ResolvedSpec → RenderSpec.** `SpecResolver.toRenderSpec()` in
`lib/src/render/render_tree.dart`. `RenderSpec` is a rendering-friendly
view: it adds computed fields (`endpoints`, `apis`, `tags`), groups
operations by tag, computes import sets, etc. `ResolvedSpec` is
semantic; `RenderSpec` is layout-aware.

**5b. RenderSpec → Dart files.** `FileRenderer.render(RenderSpec)` in
`lib/src/render/file_renderer.dart`. Walks the render tree, picks a
file path for each schema (`modelPath`, `testPath`), runs Mustache
templates from `lib/templates/`, and writes. `dart format` and `dart
fix` run via an injected `runProcess`.

**Linkage to dispatch.** `RenderOneOf` carries a back-reference to
the source `ResolvedSchemaCollection` it was built from. When a
oneOf renders, it calls `decideDispatch(source)` to retrieve the
structural decision and then translates it into mustache context
using its own render-side helpers (`wrapperTypeName`, `_planVariant`,
etc.). The resolved → render variant mapping uses index parity:
`source.schemas[i]` corresponds to the parallel `RenderOneOf.schemas[i]`.

## Phase 4.5 — Naming (in progress)

**Purpose:** assign a single Dart class name to every named entity
in the resolved tree, in one pass with the full set of names in
view.
**Lives in:** `lib/src/naming.dart`.
**Entry point:** `assignNames(ResolvedSpec) → AssignedNames`
(a `Map<JsonPointer, String>` sidecar).

**Why a separate phase.** Today, Dart class names are decided in
three different layers — the parser synthesizes inline-schema
snake names, the resolver suffixes collisions with `_1`, and the
renderer composes wrapper class names per oneOf. Each layer makes
a local decision with only partial information, so we get
artifacts like
`ProjectsCreateCardRequestProjectsCreateCardRequestOneOf0`
(parser named the variant by parent, renderer wrapped with parent
again, neither knew the other did) and
`RepositoryRulesetConditions1` (an inline schema collides with a
top-level one and gets a numeric suffix). A pass with the global
view can pick shorter, less-collision-prone names.

**Current state.** This pass exists with today's algorithm baked
in: for each `createsNewType: true` schema, the assigned name is
`camelFromSnake(common.snakeName)` — same answer the renderer's
existing `typeName` getters compute on their own. `SpecResolver`
runs `assignNames` at the start of `toRenderSpec`, looks up each
schema's name when constructing the corresponding `RenderSchema`,
and stashes it on the schema's `assignedName` field. Every newtype
`typeName` getter is now `assignedName ?? camelFromSnake(snakeName)`
— the fallback is what tests and direct constructions use;
production always populates `assignedName`. github regen is byte-
identical to before the lift (verified).

**Planned next steps:**

- Bring wrapper subclasses (the `<Parent><wrapperTag>` names from
  `RenderOneOf.wrapperTypeName`) under the pass — the dispatch
  decision already enumerates them.
- Bring operation message types (request bodies, multi-status
  return wrappers) under the pass.
- Switch the algorithm to shortest-unique-with-fallback. Candidate
  list per entity: bare name → context-prefixed → fully-qualified
  → numeric suffix; greedy assignment in stable order. This is the
  PR with the visible quality wins (96 double-prefix wrappers
  renamed; 8 `_1` suffixes mostly gone). Once the algorithm has one
  source of truth, the snake-derived fallback in `typeName` getters
  can go away too.

**The resolver stays Dart-blind.** It carries `snakeName` (a
parser-level identifier) but no Dart class name; naming sits
between resolve and render so the resolver can be reused for any
future non-Dart consumer.

## Top-level orchestration

`loadAndRenderSpec(GeneratorConfig)` in `lib/src/render.dart` is the
only entrypoint. It is a linear sequence of the phases:

```dart
final cache = Cache(fs);
final specJson = await cache.load(config.specUrl);         // Load
final spec = parseOpenApi(specJson, baseUri: ...);         // Parse
// ... build registry, resolve external refs ...
final resolved = resolveSpec(spec, specUrl, refRegistry);  // Resolve
// Dispatch is currently called per-oneOf inside RenderOneOf.toTemplateContext
// — it operates on the resolved source via the back-reference. A future
// pre-pass will hoist these calls into the orchestrator.
final renderSpec = SpecResolver(quirks).toRenderSpec(...); // Render 5a
fileRenderer.render(renderSpec);                           // Render 5b
```

The CLI (`bin/space_gen.dart`) just wires `argResults` to a
`GeneratorConfig`.

## Cross-cutting: where URIs live

Three kinds of "location" flow through the pipeline:

1. **`Ref.uri`** — what a `$ref` points at. Stored as the raw URI from
   the spec: fragment-only (`#/components/schemas/Foo`) for local refs,
   possibly relative (`shared.yaml#/Foo`) for cross-file refs. Not
   pre-resolved at parse time.
2. **`JsonPointer`** — an in-document location, attached to every
   `HasPointer` object. Relative; has no document context on its own.
3. **Registry key** — absolute URI = `docUri.resolve(pointer.fragment)`.
   Built at registration time from the parsed object's pointer and the
   doc it was registered under.

**Resolution:** the resolver tracks `currentDoc` (the document it's
reading objects out of) as it walks. Looking up a `Ref` is
`currentDoc.resolveUri(ref.uri)`, matched against the absolute registry
key. When the resolver dereferences a cross-file ref, it updates
`currentDoc` for the recursion into the target — so refs inside an
external doc resolve against that doc, not the root spec.

---

## External `$ref` support

Multi-document input is handled by a load+parse loop driven by the
real parser:

1. Parse the root spec.
2. Walk it (via `SpecWalker`) to collect every `Ref` it contains.
3. For each ref whose target is in a document not yet loaded: fetch
   that document, parse its `components:` section, register every
   `HasPointer` object in it under `docUri + pointer.fragment`.
4. Walk the newly-parsed components to pick up any *further* external
   refs; repeat until the work queue drains.
5. Hand the populated `RefRegistry` to `resolveSpec`.

This currently lives as `_loadExternalRefs` in `render.dart`, called
from `loadAndRenderSpec` between parse and resolve.

### Why the typed parser, not a raw scan?

An earlier draft used a lightweight "scan raw JSON for `$ref` strings"
pass in Load. That's tempting — it keeps Load pure-ish (no parser
dependency) and only touches one file. But `$ref` can appear as a
literal key name in user-authored `example:` payloads or inside
vendor-extension fields (`x-foo`) that the parser ignores. A raw scan
false-positives on those. Using the parser-driven walker means we only
treat something as a `$ref` if the OpenAPI parser agreed it is one —
no list of special-cases to maintain.

### Why not pre-resolve refs to absolute URIs at parse time?

Briefly tried and reverted. Refs stay as raw URIs; the resolver tracks
`currentDoc` during its walk and computes the absolute URI on lookup.
Encoding the doc-of-origin in `ResolveContext` (one mutable field,
push/pop via `withTarget`) turned out simpler than threading `baseUri`
through `ParseContext`, `MapContext`, `ListContext`, and every
`RefOr.ref` call site. Parser stays ignorant of where a doc "lives."

### Open questions

- **External docs without a `components:` wrapper.** The current
  loader assumes `{components: {...}}`. Realistic external libraries
  use this shape, but a file that is literally a single schema
  (`{type: object, properties: {...}}`) isn't reachable. Fixable by
  letting the loader parse the targeted sub-object as its expected
  type, with a synthesized `MapContext` whose `pointerParts` and
  `snakeNameStack` come from the fragment — same machinery we
  briefly used and reverted. Worth adding if real specs need it.

- **Where the load+parse loop lives.** Today it's a free function in
  `render.dart`. If the loader grows more responsibility (say, a
  `Cache.loadTransitive(rootUri)` entrypoint), it could move under
  `lib/src/loader.dart` and become the Load-phase surface area the
  orchestrator sees.

- **`Cache` visibility.** Consumed only inside `render.dart`. Not
  public API.
