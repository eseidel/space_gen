import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';
import 'package:space_gen/src/logger.dart';
import 'package:yaml/yaml.dart';

/// The settings [DartFileFormatter] hands to [DartFormatter] for files
/// in the consuming package. Resolved once per [DartFileFormatter] and
/// reused for every file the generator writes.
class FormatContext {
  const FormatContext({
    required this.languageVersion,
    required this.pageWidth,
    required this.trailingCommas,
  });

  /// Lower bound of the consuming package's `environment.sdk`
  /// constraint (or the most recently resolved SDK from
  /// `pubspec.lock`). Picks short style for SDKs < 3.7 and tall style
  /// for SDKs >= 3.7. Falls back to
  /// [DartFormatter.latestLanguageVersion] when no consumer pubspec is
  /// found.
  final Version languageVersion;

  /// `formatter.page_width` from `analysis_options.yaml` if set;
  /// otherwise null and [DartFormatter] uses its own default (80).
  final int? pageWidth;

  /// `formatter.trailing_commas` from `analysis_options.yaml` if set;
  /// otherwise null and [DartFormatter] uses its own default
  /// ([TrailingCommas.automate]).
  final TrailingCommas? trailingCommas;
}

/// The subset of `analysis_options.yaml`'s `formatter:` section that
/// [DartFormatter] can consume directly.
class FormatterConfig {
  const FormatterConfig({this.pageWidth, this.trailingCommas});
  final int? pageWidth;
  final TrailingCommas? trailingCommas;
}

/// Block prepended to generated `.dart` files that still contain a
/// line over 80 cols after `dart format` / `dart fix`. The preceding
/// comment satisfies the `document_ignores` lint from
/// `very_good_analysis`. Exposed for tests.
@visibleForTesting
const longLineIgnoreBlock =
    '// Some OpenAPI specs flatten inline schemas into class names long\n'
    "// enough that `dart format` can't keep imports and call sites under\n"
    '// 80 cols as bare identifiers.\n'
    '// ignore_for_file: lines_longer_than_80_chars';

/// Returns [content] with [longLineIgnoreBlock] prepended if any line
/// outside the analyzer's existing carve-outs (URI imports/exports)
/// exceeds 80 cols. Threaded through [maybeAddIgnoreDirectives] at
/// file-emit time on every space_gen-emitted file — hand-written
/// templates skip the call so a directive isn't smuggled into files
/// space_gen doesn't own.
///
/// Skipping `import` / `export` lines mirrors the analyzer's own
/// behavior: `lines_longer_than_80_chars` ignores URIs, so a long
/// `import` was never going to fire the lint and shouldn't trigger
/// the directive either (the unused directive in turn trips
/// `unnecessary_ignore`).
@visibleForTesting
String maybeAddLongLineIgnore(String content) {
  const marker = '// ignore_for_file: lines_longer_than_80_chars';
  if (content.contains(marker)) return content;
  final hasFlaggableLongLine = content.split('\n').any((line) {
    if (line.length <= 80) return false;
    final trimmed = line.trimLeft();
    if (trimmed.startsWith('import ')) return false;
    if (trimmed.startsWith('export ')) return false;
    return true;
  });
  if (!hasFlaggableLongLine) return content;
  return '$longLineIgnoreBlock\n$content';
}

/// Block prepended to generated `.dart` files whose dartdoc contains
/// `[…]` patterns that don't resolve (e.g. github's code-of-conduct
/// description literally has the form "contacting the project team
/// at \[EMAIL\]", and the MIT license template carries \[year\] and
/// \[fullname\] placeholders). Exposed for tests.
@visibleForTesting
const commentReferencesIgnoreBlock =
    '// Spec descriptions copy prose verbatim into dartdoc, where `[x]`\n'
    '// inside a sentence (placeholder text, ALL_CAPS tokens, license\n'
    '// templates) is parsed as a symbol reference even when no such\n'
    '// symbol exists. Suppress file-locally so the lint stays live\n'
    '// elsewhere; spec authors do not always escape brackets.\n'
    '// ignore_for_file: comment_references';

/// Block prepended to generated `.dart` files whose dartdoc contains
/// `<...>` patterns that dartdoc parses as (unclosed) HTML tags (e.g.
/// Backstage's catalog spec describes an entity ref as
/// `location:default/generated-<sha1hex>`, and `<sha1hex>` reads as a
/// tag start to dartdoc). Exposed for tests.
@visibleForTesting
const unintendedHtmlInDocCommentIgnoreBlock =
    '// Spec descriptions copy prose verbatim into dartdoc, where `<x>`\n'
    '// is parsed as an HTML tag start even when it is not HTML (e.g.\n'
    '// placeholder tokens like `<sha1hex>`).\n'
    '// Suppress file-locally so the lint stays live elsewhere; spec\n'
    '// authors do not always escape angle brackets.\n'
    '// ignore_for_file: unintended_html_in_doc_comment';

/// Returns [content] with [unintendedHtmlInDocCommentIgnoreBlock]
/// prepended if any `///` doc comment carries an angle-bracket token
/// that dartdoc parses as an HTML tag start. Threaded through
/// [maybeAddIgnoreDirectives] at file-emit time on every space_gen-
/// emitted file — hand-written templates skip the call so a spurious
/// `<...>` in their docs doesn't get silently suppressed when it
/// should be fixed at the source.
///
/// Mirrors [maybeAddCommentReferencesIgnore]'s approach to `[x]`
/// bracketed refs (PR #138): spec prose / spec shapes that trip
/// dartdoc's parser should be sanitized at the generator boundary
/// rather than forcing every consumer to hand-suppress.
@visibleForTesting
String maybeAddUnintendedHtmlIgnore(String content) {
  const marker = '// ignore_for_file: unintended_html_in_doc_comment';
  if (content.contains(marker)) return content;
  if (!_dartdocHasHtmlTag(content)) return content;
  return '$unintendedHtmlInDocCommentIgnoreBlock\n$content';
}

/// Whether any `///` doc comment line in [content] carries an
/// angle-bracket token dartdoc would parse as an HTML tag start.
///
/// Matches `<` immediately followed by a letter or `/` — the shapes
/// dartdoc's HTML parser treats as element starts (HTML names must
/// start with an ASCII letter). Plain prose like `a < b` or `i < 0`
/// does not match because the character after `<` is a space or
/// digit, not a letter. Self-closing `<br/>`-style tags and closing
/// `</foo>` tags both match via the leading `/` arm only when a
/// letter follows (so `</` followed by whitespace won't match).
bool _dartdocHasHtmlTag(String content) {
  final tagRe = RegExp('</?[A-Za-z]');
  for (final line in content.split('\n')) {
    final stripped = line.trimLeft();
    if (!stripped.startsWith('///')) continue;
    if (tagRe.hasMatch(stripped)) return true;
  }
  return false;
}

/// Returns [content] with [commentReferencesIgnoreBlock] prepended if
/// any `///` doc comment carries a bracketed token that wouldn't
/// resolve in scope. Threaded through [maybeAddIgnoreDirectives] at
/// file-emit time on every space_gen-emitted file — hand-written
/// templates skip the call so a spurious `[FormatException]`
/// reference in their docs doesn't get silently suppressed when it
/// should be fixed at the source.
///
/// "In scope" today means *declared in the same file* — top-level
/// types ([_topLevelDeclarations]) plus same-file field declarations
/// (so e.g. shorebird's `/// The signature of the [hash].` resolves
/// against `final String hash;`). Imported names aren't tracked yet
/// — see #142 — so a `[Foo]` ref to an imported type still triggers
/// the directive even when it would resolve.
@visibleForTesting
String maybeAddCommentReferencesIgnore(String content) {
  final tokens = _bracketedDartdocTokens(content);
  if (tokens.isEmpty) return content;
  final declared = _topLevelDeclarations(content);
  // For a member-style ref like `[Foo.fromJson]`, the analyzer resolves
  // it iff the head (`Foo`) does — so check against the head, not the
  // full token. Doesn't catch refs to inherited members reached without
  // a qualifier (`[fromJson]`); those still trip the directive, which
  // is fine.
  bool resolvesLocally(String t) => declared.contains(t.split('.').first);
  if (tokens.every(resolvesLocally)) return content;
  return '$commentReferencesIgnoreBlock\n$content';
}

/// Composes the per-file emit-time suppression helpers applied by
/// `_renderSpecTemplate`. Adding a new gen-time suppression to the
/// pipeline is a single edit here; call sites stay unchanged.
/// Hand-written templates use `_renderTemplate` instead and bypass
/// this entirely (see #138's design rationale).
String maybeAddIgnoreDirectives(String content) => maybeAddLongLineIgnore(
  maybeAddCommentReferencesIgnore(maybeAddUnintendedHtmlIgnore(content)),
);

/// Collects every `[token]` bracketed reference inside a `///` doc
/// comment, ignoring `[Foo](url)` markdown links (the `(?!\()` guard).
Set<String> _bracketedDartdocTokens(String content) {
  final tokenRe = RegExp(r'\[([^\]\s]+)\](?!\()');
  final tokens = <String>{};
  for (final line in content.split('\n')) {
    final stripped = line.trimLeft();
    if (!stripped.startsWith('///')) continue;
    for (final m in tokenRe.allMatches(stripped)) {
      tokens.add(m.group(1)!);
    }
  }
  return tokens;
}

/// Collects the names of declarations the analyzer would resolve a
/// `[token]` bracketed dartdoc reference against. Two regexes:
///
/// - **Top-level types** the renderer emits — `class`, `enum`,
///   `mixin`, `extension type [const] Foo._(...)`. Match the
///   uppercase-leading name.
/// - **Class members** the renderer emits as `final` / `late final` /
///   `var` / `const` / `static` fields. Match the identifier after
///   the type. Catches the common shape spec dartdoc refers to —
///   e.g. shorebird's `/// The signature of the [hash].` resolves
///   to a `final String hash;` field, which the analyzer's
///   `comment_references` lint follows through enclosing class
///   scope.
///
/// Methods and getters / setters aren't tracked (the regex would
/// over-match too easily). A `[fooMethod]` ref that resolves only
/// via a method declaration still trips the directive — false
/// positive, but harmless: the directive is per-file and only
/// suppresses `comment_references`.
Set<String> _topLevelDeclarations(String content) {
  final declRe = RegExp(
    r'(?:class|enum|mixin|extension type(?:\s+const)?)\s+'
    '([A-Z][A-Za-z0-9_]*)',
  );
  final memberRe = RegExp(
    r'(?:final|late\s+final|const|var|static)\s+\S+\s+([a-zA-Z_]\w*)',
  );
  final names = <String>{};
  for (final m in declRe.allMatches(content)) {
    names.add(m.group(1)!);
  }
  for (final m in memberRe.allMatches(content)) {
    names.add(m.group(1)!);
  }
  return names;
}

/// Signature for the function [Formatter] uses to spawn `dart`
/// subprocesses. Defaults to [Process.runSync]; tests can swap in a
/// fake to assert the commands without actually running them.
typedef RunProcess =
    ProcessResult Function(
      String executable,
      List<String> arguments, {
      String? workingDirectory,
    });

/// Runs the global `dart pub get` / `dart format` / `dart fix --apply`
/// chain against the output package after every file has been
/// written. The format step is currently a near no-op for files
/// space_gen wrote (they already went through [DartFileFormatter] at
/// write time) but `dart fix --apply` still does meaningful work
/// (removing unused imports, applying auto-fixes for various lints).
class Formatter {
  Formatter({RunProcess? runProcess})
    : runProcess = runProcess ?? Process.runSync;

  /// The function to run a process. Allows for mocking in tests.
  final RunProcess runProcess;

  /// Run a dart command.
  void _runDart(List<String> args, {required String workingDirectory}) {
    final command = 'dart ${args.join(' ')}';
    logger
      ..info('Running $command')
      ..detail('$command in $workingDirectory');
    final stopwatch = Stopwatch()..start();
    final result = runProcess(
      Platform.executable,
      args,
      workingDirectory: workingDirectory,
    );
    if (result.exitCode != 0) {
      logger.info(result.stderr as String);
      throw Exception('Failed to run dart ${args.join(' ')}');
    }
    final ms = stopwatch.elapsed.inMilliseconds;
    logger
      ..detail(result.stdout as String)
      ..info('$command took $ms ms');
  }

  void formatAndFix({required String pkgDir}) {
    // `pub get` (not `--offline`) so generation doesn't silently depend on
    // whatever happens to be in the machine-global pub cache. On a warm
    // cache the network round-trip is marginal; on a cold one (e.g. CI),
    // `--offline` fails with a confusing "package X not in cache" error
    // whenever a template dep isn't coincidentally also a space_gen dep.
    _runDart(['pub', 'get'], workingDirectory: pkgDir);
    // Run format first to add missing commas.
    _runDart(['format', '.'], workingDirectory: pkgDir);
    // Then run fix to clean up various other things.
    _runDart(['fix', '.', '--apply'], workingDirectory: pkgDir);
    // Run format again to fix wrapping of lines.
    _runDart(['format', '.'], workingDirectory: pkgDir);
  }
}

/// Formats `.dart` content in-process using `package:dart_style`'s
/// [DartFormatter], with settings resolved from the consuming
/// package's `pubspec` and `analysis_options.yaml`. The resolution
/// runs once per instance on the first `.dart` write and is reused
/// for every subsequent file.
///
/// Why in-process: the gen-time ignore-directive helpers
/// ([maybeAddLongLineIgnore], [maybeAddCommentReferencesIgnore])
/// need to make decisions against post-format content. Without
/// running the formatter ourselves at write time, we'd be measuring
/// pre-format lines and mispredicting what survives the global
/// `dart format` — which leads to the directive being added when
/// it's not needed and `dart fix --apply` then stripping it but
/// leaving the justification comment orphaned.
///
/// Why per-consumer settings: a project on SDK < 3.7 uses short
/// style; one that opts into `formatter: trailing_commas: preserve`
/// in its `analysis_options.yaml` wants its multi-line forms kept
/// even when they'd fit on a single line. Hard-pinning to
/// [DartFormatter.latestLanguageVersion] silently changes the style
/// of generated files vs. what the consumer would have produced.
class DartFileFormatter {
  DartFileFormatter({required this.fs, required this.outDir});

  /// File system to read pubspec / analysis_options through. Lets
  /// tests use an in-memory file system without touching real disk.
  final FileSystem fs;

  /// Root of the package the generator is writing into; resolution
  /// walks up from here.
  final Directory outDir;

  /// Cached per-output-package formatter config. Resolved on the
  /// first `.dart` call to [formatIfDart] and reused for every
  /// subsequent file.
  FormatContext? _context;

  /// Format [content] with [DartFormatter] iff [outPath] is a
  /// `.dart` file. Non-Dart outputs (`pubspec.yaml`, `.gitignore`,
  /// `analysis_options.yaml`, `cspell.config.yaml`) pass through
  /// unchanged.
  String formatIfDart(String outPath, String content) {
    if (!outPath.endsWith('.dart')) return content;
    final ctx = _context ??= _resolveContext();
    return DartFormatter(
      languageVersion: ctx.languageVersion,
      pageWidth: ctx.pageWidth,
      trailingCommas: ctx.trailingCommas,
    ).format(content);
  }

  /// Walk up from [outDir] collecting the SDK constraint (for
  /// language version) and any `formatter:` config from
  /// `analysis_options.yaml`. Mirrors what `dart format` does when
  /// invoked on a package — including respecting workspace setups
  /// where the package's own `analysis_options.yaml` only `include:`s
  /// a parent file at the workspace root.
  ///
  /// Resolution order at each directory:
  /// - `pubspec.lock` → `sdks.dart` lower bound (most authoritative,
  ///   set by the most recent `pub get`).
  /// - `pubspec.yaml` → `environment.sdk` lower bound (fallback before
  ///   any `pub get`).
  /// - `analysis_options.yaml` → `formatter:` page width and trailing
  ///   commas. Follows simple relative-path `include:` directives;
  ///   `package:` includes are skipped (resolving them would require
  ///   running pub).
  ///
  /// Falls back to [DartFormatter.latestLanguageVersion] and
  /// `dart_style` defaults when nothing is found.
  FormatContext _resolveContext() {
    Version? languageVersion;
    int? pageWidth;
    TrailingCommas? trailingCommas;
    var dir = outDir;
    while (true) {
      languageVersion ??= _readSdkLowerBound(dir);
      final analysisOptsPath = p.join(dir.path, 'analysis_options.yaml');
      final analysisOpts = fs.file(analysisOptsPath);
      if (analysisOpts.existsSync()) {
        final formatter = _readFormatterConfig(analysisOpts);
        pageWidth ??= formatter.pageWidth;
        trailingCommas ??= formatter.trailingCommas;
      }
      if (languageVersion != null &&
          pageWidth != null &&
          trailingCommas != null) {
        break;
      }
      final parent = dir.parent;
      if (parent.path == dir.path) break;
      dir = parent;
    }
    return FormatContext(
      languageVersion: languageVersion ?? DartFormatter.latestLanguageVersion,
      pageWidth: pageWidth,
      trailingCommas: trailingCommas,
    );
  }

  /// Read the SDK constraint's lower bound from [dir]'s `pubspec.lock`
  /// (preferred — reflects the resolved SDK from the most recent `pub
  /// get`) or `pubspec.yaml` (fallback). Returns null if neither file
  /// exists in [dir] or neither carries a parsable Dart constraint.
  Version? _readSdkLowerBound(Directory dir) {
    Version? fromConstraintString(String? constraint) {
      if (constraint == null) return null;
      try {
        final parsed = VersionConstraint.parse(constraint);
        return parsed is VersionRange ? parsed.min : null;
      } on FormatException {
        return null;
      }
    }

    final lock = fs.file(p.join(dir.path, 'pubspec.lock'));
    if (lock.existsSync()) {
      try {
        final yaml = loadYaml(lock.readAsStringSync());
        if (yaml is Map) {
          final sdks = yaml['sdks'];
          if (sdks is Map) {
            final v = fromConstraintString(sdks['dart'] as String?);
            if (v != null) return v;
          }
        }
      } on YamlException {
        // Fall through to pubspec.yaml.
      }
    }
    final spec = fs.file(p.join(dir.path, 'pubspec.yaml'));
    if (spec.existsSync()) {
      try {
        final yaml = loadYaml(spec.readAsStringSync());
        if (yaml is Map) {
          final env = yaml['environment'];
          if (env is Map) {
            return fromConstraintString(env['sdk'] as String?);
          }
        }
      } on YamlException {
        return null;
      }
    }
    return null;
  }

  /// Read `formatter:` settings out of [analysisOpts], following a
  /// single relative-path `include:` if the local file doesn't carry
  /// the section itself. Workspaces commonly have a package-level
  /// `analysis_options.yaml` that only `include:`s the workspace
  /// root's. `package:`-scheme includes are not followed (we'd need
  /// to resolve the package URI through pub).
  FormatterConfig _readFormatterConfig(File analysisOpts) {
    try {
      final yaml = loadYaml(analysisOpts.readAsStringSync());
      if (yaml is! Map) return const FormatterConfig();
      final formatter = yaml['formatter'];
      if (formatter is Map) {
        final pageWidth = formatter['page_width'];
        final trailingCommasStr = formatter['trailing_commas'];
        final trailingCommas = switch (trailingCommasStr) {
          'preserve' => TrailingCommas.preserve,
          'automate' => TrailingCommas.automate,
          _ => null,
        };
        return FormatterConfig(
          pageWidth: pageWidth is int ? pageWidth : null,
          trailingCommas: trailingCommas,
        );
      }
      // No formatter: section here — try a single include if present.
      final include = yaml['include'];
      if (include is String && !include.startsWith('package:')) {
        final resolved = fs.file(
          p.normalize(p.join(analysisOpts.parent.path, include)),
        );
        if (resolved.existsSync()) return _readFormatterConfig(resolved);
      }
      return const FormatterConfig();
    } on YamlException {
      return const FormatterConfig();
    }
  }
}
