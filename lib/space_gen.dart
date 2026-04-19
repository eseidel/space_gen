export 'src/logger.dart' show Logger, logger, runWithLogger, setVerboseLogging;
export 'src/quirks.dart' show Quirks;
export 'src/render.dart' show FileRendererBuilder, loadAndRenderSpec;
// Experimental: hooks for custom file layouts. The surface here is
// expected to evolve as more consumers surface needs — treat this as
// a preview rather than a stable API. Consumers typically subclass
// [FileRenderer] in their own generator entrypoint rather than
// importing a canned variant from here — see `tool/gen_shorebird.dart`
// for an example.
export 'src/render/file_renderer.dart'
    show FileRenderer, FileWriter, Formatter, SpellChecker;
export 'src/render/render_tree.dart' show RenderSchema;
export 'src/render/schema_renderer.dart' show SchemaRenderer;
export 'src/render/templates.dart' show TemplateProvider;
