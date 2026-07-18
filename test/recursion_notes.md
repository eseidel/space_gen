OK, I need to fix my resolver to handle recursive references.

Right now we eagerly resolve all references during resolveSpec,
but for references to *rendered* schemas, we should resolve them, but store
them into a map of pointer -> ResolvedSchema and instead store a ResolvedRef
object in the actual resolved tree.

ResolvedRef will never render itself, only proxy through to its resolved target?

Maybe ResolvedRef actually holds a pointer to the resolved schema in the Map?

Maybe it's actually ResolvedProxy rather than ResolvedRef?

Either way it needs to know the pointer and needs to proxy to the actual
resolved schema, but when creating the RenderTree we'll need to also make a
RenderProxy or similar that only holds the information about the pointer/name
for import generation and not any information about how to actually render
the schema since that won't be it's job.
