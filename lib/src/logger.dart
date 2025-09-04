import 'package:mason_logger/mason_logger.dart';
import 'package:scoped_deps/scoped_deps.dart';

export 'package:mason_logger/mason_logger.dart';

/// A reference to the global logger using package:scoped to create.
final ScopedRef<Logger> loggerRef = create(Logger.new);

/// A getter for the global logger using package:scoped to read.
/// This is a getter so that it cannot be replaced directly, if you wish
/// to mock the logger use runScoped with override values.
Logger get logger => read(loggerRef);

/// Run [fn] with the global logger replaced with [logger].
R runWithLogger<R>(Logger logger, R Function() fn) {
  return runScoped(fn, values: {loggerRef.overrideWith(() => logger)});
}

/// Set the global logger to verbose logging.
void setVerboseLogging() {
  logger.level = Level.verbose;
}
