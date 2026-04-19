export 'src/cli.dart' show runCli;
export 'src/logger.dart' show Logger, logger, runWithLogger, setVerboseLogging;
export 'src/quirks.dart' show Quirks;
export 'src/render.dart'
    show FileRendererBuilder, GeneratorConfig, loadAndRenderSpec;
// Experimental: hooks for custom file layouts. Consumers subclass
// [FileRenderer] in their own generator entrypoint and override the
// `@protected` hooks — see `tool/gen_shorebird.dart` for an example.
// The collaborators bundled inside [FileRendererConfig] are
// constructed by [loadAndRenderSpec] and threaded through to the
// subclass via `super(config)`, so their concrete types aren't part
// of the exported surface.
export 'src/render/file_renderer.dart'
    show FileRenderer, FileRendererConfig, LayoutContext;
export 'src/render/render_tree.dart' show RenderSchema;
