import 'package:dart_style/dart_style.dart';
import 'package:file/memory.dart';
import 'package:space_gen/src/render/formatting.dart';
import 'package:test/test.dart';

void main() {
  group('maybeAddLongLineIgnore', () {
    test('passes through short-only content', () {
      final content =
          '${List.generate(5, (i) => 'var x$i = $i;').join('\n')}\n';
      expect(maybeAddLongLineIgnore(content), content);
    });

    test('prepends directive when a non-import line exceeds 80 cols', () {
      final longLine = 'final x = ${'a' * 80};';
      final content = 'var x = 1;\n$longLine\n';
      expect(
        maybeAddLongLineIgnore(content),
        startsWith('$longLineIgnoreBlock\n'),
      );
    });

    test('is idempotent — does not stack the directive', () {
      final longLine = 'final x = ${'a' * 80};';
      final content = '$longLineIgnoreBlock\n$longLine\n';
      // Directive present exactly once before and after.
      expect(longLineIgnoreBlock.allMatches(content).length, 1);
      final result = maybeAddLongLineIgnore(content);
      expect(longLineIgnoreBlock.allMatches(result).length, 1);
    });

    test('passes through when only long lines are imports', () {
      // Mirrors the analyzer's `lines_longer_than_80_chars` carve-out
      // for URI imports — flagging these would trip `unnecessary_ignore`
      // because the underlying lint never fires.
      final longImport =
          "import 'package:${'a' * 60}/foo.dart' as ${'b' * 30};";
      final content = '$longImport\nclass Foo {}\n';
      expect(longImport.length, greaterThan(80));
      expect(maybeAddLongLineIgnore(content), content);
    });

    test('passes through when only long lines are exports', () {
      final longExport =
          "export 'package:${'a' * 60}/foo.dart' show ${'b' * 30};";
      final content = '$longExport\nclass Foo {}\n';
      expect(longExport.length, greaterThan(80));
      expect(maybeAddLongLineIgnore(content), content);
    });

    test('fires when a `///` doc comment exceeds 80 cols', () {
      // The analyzer's lines_longer_than_80_chars lint flags long
      // doc comments — only URI imports/exports are exempt. Verified
      // empirically: github regen surfaced 37 such hits before this
      // carve-out was removed.
      final longDoc = '/// ${'a' * 90}';
      final content = '$longDoc\nclass Foo {}\n';
      expect(longDoc.length, greaterThan(80));
      expect(
        maybeAddLongLineIgnore(content),
        startsWith('$longLineIgnoreBlock\n'),
      );
    });

    test('still fires when a real long line sits next to a long import', () {
      final longImport =
          "import 'package:${'a' * 60}/foo.dart' as ${'b' * 30};";
      final longCode = 'final x = ${'a' * 80};';
      final content = '$longImport\n$longCode\n';
      expect(
        maybeAddLongLineIgnore(content),
        startsWith('$longLineIgnoreBlock\n'),
      );
    });

    test('treats exactly 80 chars as not over', () {
      final exactly80 = 'x' * 80;
      final content = '$exactly80\n';
      expect(maybeAddLongLineIgnore(content), content);
    });
  });

  group('maybeAddCommentReferencesIgnore', () {
    test('passes through content with no bracketed dartdoc tokens', () {
      const content = '/// A class with no bracket refs.\nclass Foo {}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('prepends directive when dartdoc has prose-style placeholder', () {
      // Mirrors github's `code_of_conduct.dart` ("contacting the project
      // team at [EMAIL]") and `license.dart` (`[year] [fullname]`).
      const content =
          '/// Reach out at [EMAIL] for support.\nclass CodeOfConduct {}\n';
      expect(
        maybeAddCommentReferencesIgnore(content),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });

    test('passes through `[Foo](url)` markdown links', () {
      const content =
          '/// See [the docs](https://example.com).\nclass Bar {}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('does not match plain-comment brackets, only `///` doc comments', () {
      // Inline `// [SOMETHING]` comments are invisible to dartdoc and
      // can't trip `comment_references`.
      const content = '// [PLACEHOLDER] not a dartdoc.\nclass Foo {}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('passes through when every ref is a same-file class', () {
      // The most common case for spec-derived model files: the doc
      // comment refers to the class the file declares. The lint
      // wouldn't fire on these — no need to suppress.
      const content =
          '/// Convert a Map to a [Foo].\n'
          '/// Round-trips with [Foo.fromJson].\n'
          'class Foo {}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('passes through same-file enum and extension-type refs', () {
      // The renderer emits all three top-level declaration kinds
      // (class, enum, extension type); they all need to count as
      // in-scope.
      const content =
          '/// See [Mood] and [Tag].\n'
          'enum Mood { happy, sad }\n'
          'extension type const Tag._(String value) {}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('prepends when even one ref escapes the same-file set', () {
      // `[Foo]` resolves locally, but `[ImportedThing]` does not
      // (imports aren't tracked yet — see #142). One unresolved ref
      // is enough to need the directive.
      const content =
          '/// [Foo] uses an [ImportedThing] under the hood.\n'
          'class Foo {}\n';
      expect(
        maybeAddCommentReferencesIgnore(content),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });

    test('passes through refs to fields declared in the same file', () {
      // Surfaced by shorebird_code_push_protocol's
      // `create_patch_artifact_request.dart`: `/// The signature of
      // the [hash].` refers to a `final String hash;` field. The
      // analyzer resolves this through the enclosing class scope and
      // doesn't fire `comment_references`. Without tracking field
      // declarations, the helper would add a directive that
      // `dart fix --apply` then strips as `unnecessary_ignore`,
      // leaving an orphaned 5-line justification comment.
      const content =
          '/// The signature of the [hash].\n'
          'class CreatePatchArtifactRequest {\n'
          '  final String hash;\n'
          '}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('still prepends for refs that look like fields but are not', () {
      // MIT license templates use `[year]` and `[fullname]` as
      // placeholders. They look like field names but no field is
      // declared with those names, so `comment_references` would
      // fire and the directive is needed.
      const content =
          '/// Copyright (c) [year] [fullname].\n'
          'class License {}\n';
      expect(
        maybeAddCommentReferencesIgnore(content),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });

    test('collects multiple refs on a single doc comment line', () {
      // Greedy regexes have a habit of seeing only the first or last
      // bracket on a line. Both refs need to be considered: if any
      // one fails to resolve, we suppress.
      const contentAllResolve =
          '/// Compare [A] with [B] and [C].\n'
          'class A {}\nclass B {}\nclass C {}\n';
      expect(
        maybeAddCommentReferencesIgnore(contentAllResolve),
        contentAllResolve,
      );

      const contentMiddleEscapes =
          '/// Compare [A] with [Missing] and [C].\n'
          'class A {}\nclass C {}\n';
      expect(
        maybeAddCommentReferencesIgnore(contentMiddleEscapes),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });

    test('member refs resolve via the head before the dot', () {
      // `[Foo.fromJson]` resolves iff `Foo` does — the analyzer walks
      // the head against scope, then looks up the member on whatever
      // it finds. Test both the resolves-via-head case and the head-
      // doesn't-resolve case.
      const resolves =
          '/// Round-trips through [Foo.fromJson] and [Foo.toJson].\n'
          'class Foo {}\n';
      expect(maybeAddCommentReferencesIgnore(resolves), resolves);

      const headMissing =
          '/// Calls [Missing.method] internally.\nclass Foo {}\n';
      expect(
        maybeAddCommentReferencesIgnore(headMissing),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });

    test('refs are checked against every top-level declaration', () {
      // A real generated file can declare more than one class (e.g. a
      // model plus an inner enum). The declaration scan has to find
      // them all, not just the first one.
      const content =
          '/// [Outer] holds a list of [Inner].\n'
          'class Outer {}\n\nenum Inner { a, b }\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('indented `///` member docs still count', () {
      // Generated classes sit at the top level but their member dartdoc
      // lives inside the class body, indented. The token scan must not
      // require the `///` to be at column 0.
      const content =
          'class Foo {\n'
          '  /// Members of [Foo] go here.\n'
          '  void doThing() {}\n'
          '}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('passes through GitHub Markdown alert markers', () {
      // github spec prose copies GitHub-flavored-Markdown alerts
      // verbatim: `> [!NOTE]`, `> [!WARNING]`. `!NOTE` is not a valid
      // Dart identifier, so `comment_references` never parses it as a
      // reference — these were the single biggest false trigger, the
      // sole reason for the directive on 27 of github's 43 annotated
      // files (#142).
      const content =
          '/// [!NOTE]\n'
          '/// [!WARNING] this endpoint is rate limited.\n'
          'class Repo {}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('passes through bracketed literals and numbers', () {
      // Quoted enum-value prose (`["push"]`, `['pull']`) and bare
      // numbers (`[789]`) are not identifiers, so the lint leaves them
      // as plain text. Collecting them made the file look like it
      // needed suppression.
      const content =
          '/// One of [\'push\'], ["pull"], or the id [789].\n'
          'class Event {}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('a real ref among alert markers still needs the directive', () {
      // Dropping the noise must not drop a genuine unresolved reference
      // sharing the same doc comment.
      const content =
          '/// [!NOTE]\n'
          '/// See [ImportedThing] for details.\n'
          'class Repo {}\n';
      expect(
        maybeAddCommentReferencesIgnore(content),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });

    test('passes through refs to bare (keyword-less) mutable-model fields', () {
      // Mutable models (`Quirks.openapi()`) emit fields with no leading
      // keyword: `String? workflows;`. The analyzer resolves a
      // `[workflows]` ref against that field, so no directive is
      // needed. Before #363 the keyword-only member scan missed these
      // and the file got a spurious directive.
      const content =
          '/// The [workflows] to run.\n'
          'class Pipeline {\n'
          '  String? workflows;\n'
          '}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('passes through refs to bare fields with generic types', () {
      // `Map<String, dynamic> entries;` — the generic arguments (with
      // their embedded spaces and commas) must not throw off the
      // field-name capture.
      const content =
          '/// The [entries] and [attributes] of this object.\n'
          'class Bag {\n'
          '  Map<String, dynamic> entries;\n'
          '  Map<String, String> attributes;\n'
          '}\n';
      expect(maybeAddCommentReferencesIgnore(content), content);
    });

    test('does not treat a `return foo;` statement as a field declaration', () {
      // A bare-field matcher must not pick up keyword-led statements
      // that share the `<word> <word>;` shape. Here `[result]` resolves
      // to nothing (it is only a method-local return value), so the
      // directive is still required — adding it to the resolved set
      // would wrongly suppress a real `comment_references` lint.
      const content =
          '/// Returns the [result].\n'
          'class Runner {\n'
          '  Object run() {\n'
          '    final result = compute();\n'
          '    return result;\n'
          '  }\n'
          '}\n';
      expect(
        maybeAddCommentReferencesIgnore(content),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });

    test('does not treat a getter as a bare field declaration', () {
      // `int get hashCode => ...;` is a getter, not a field. The
      // bare-field scan must not add `hashCode`; getters remain
      // untracked, so a ref resolving only via one still needs the
      // directive (documents the boundary, matches pre-#363 behavior).
      const content =
          '/// Mirrors [answer].\n'
          'class Thing {\n'
          '  int get answer => 42;\n'
          '}\n';
      expect(
        maybeAddCommentReferencesIgnore(content),
        startsWith('$commentReferencesIgnoreBlock\n'),
      );
    });
  });

  group('maybeAddUnintendedHtmlIgnore', () {
    test('passes through content with no angle-bracket dartdoc', () {
      const content = '/// A class with no angle brackets.\nclass Foo {}\n';
      expect(maybeAddUnintendedHtmlIgnore(content), content);
    });

    test(
      'prepends directive when dartdoc has an angle-bracket tag-like token',
      () {
        // Mirrors Backstage's catalog spec: an entity ref example like
        // `location:default/generated-<sha1hex>`.
        const content =
            '/// The entity ref, e.g. location:default/generated-<sha1hex>.\n'
            'final String entityRef;\n';
        expect(
          maybeAddUnintendedHtmlIgnore(content),
          startsWith('$unintendedHtmlInDocCommentIgnoreBlock\n'),
        );
      },
    );

    test('does not match plain-comment angle brackets, only `///` doc', () {
      // A `//` line comment with `<sha1hex>` should not trigger.
      const content = '// note: see <sha1hex> for details\nclass Foo {}\n';
      expect(maybeAddUnintendedHtmlIgnore(content), content);
    });

    test('does not fire on comparison prose like `a < b` or `i < 0`', () {
      const content =
          '/// Returns true if a < b for all i < 0.\n'
          'bool compare() => true;\n';
      expect(maybeAddUnintendedHtmlIgnore(content), content);
    });

    test('fires on closing-tag-shaped `</foo>` in dartdoc', () {
      const content = '/// Closes with </body>.\nclass Foo {}\n';
      expect(
        maybeAddUnintendedHtmlIgnore(content),
        startsWith('$unintendedHtmlInDocCommentIgnoreBlock\n'),
      );
    });

    test('idempotent: does not double-prepend if marker already present', () {
      const content =
          '$unintendedHtmlInDocCommentIgnoreBlock\n'
          '/// e.g. <sha1hex>\nclass Foo {}\n';
      expect(
        unintendedHtmlInDocCommentIgnoreBlock.allMatches(content).length,
        1,
      );
      final result = maybeAddUnintendedHtmlIgnore(content);
      expect(
        unintendedHtmlInDocCommentIgnoreBlock.allMatches(result).length,
        1,
      );
    });

    test('indented `///` member docs still count', () {
      const content =
          'class Foo {\n'
          '  /// e.g. <sha1hex>\n'
          '  final String ref;\n'
          '}\n';
      expect(
        maybeAddUnintendedHtmlIgnore(content),
        startsWith('$unintendedHtmlInDocCommentIgnoreBlock\n'),
      );
    });

    test('does not fire on angle brackets inside an inline code span', () {
      // dartdoc renders code spans verbatim, so the lint never fires on
      // `Map<String, dynamic>` inside backticks.
      const content =
          '/// Serializes to `Map<String, dynamic>`.\n'
          'class Foo {}\n';
      expect(maybeAddUnintendedHtmlIgnore(content), content);
    });

    test('still fires on a raw tag outside a code span on the same line', () {
      const content =
          '/// Use `Map<String, int>` not <foo>.\n'
          'class Foo {}\n';
      expect(
        maybeAddUnintendedHtmlIgnore(content),
        startsWith('$unintendedHtmlInDocCommentIgnoreBlock\n'),
      );
    });

    test('does not fire on angle brackets inside a fenced code block', () {
      const content =
          '/// Example:\n'
          '/// ```\n'
          '/// Map<String, int> m;\n'
          '/// ```\n'
          'class Foo {}\n';
      expect(maybeAddUnintendedHtmlIgnore(content), content);
    });

    test('fires again once the fence closes', () {
      const content =
          '/// ```\n'
          '/// Map<String, int> m;\n'
          '/// ```\n'
          '/// Then see <sha1hex>.\n'
          'class Foo {}\n';
      expect(
        maybeAddUnintendedHtmlIgnore(content),
        startsWith('$unintendedHtmlInDocCommentIgnoreBlock\n'),
      );
    });
  });

  group('DartFileFormatter', () {
    DartFileFormatter buildFormatter(Map<String, String> files) {
      final fs = MemoryFileSystem.test();
      for (final entry in files.entries) {
        final f = fs.file(entry.key);
        f.parent.createSync(recursive: true);
        f.writeAsStringSync(entry.value);
      }
      return DartFileFormatter(fs: fs, outDir: fs.directory('/pkg'));
    }

    test('formatIfDart passes through non-Dart paths unchanged', () {
      // pubspec.yaml, .gitignore, analysis_options.yaml etc. should
      // not be run through DartFormatter — it'd throw.
      final formatter = buildFormatter({});
      const yaml = 'name: foo\nversion: 1.0.0\n';
      expect(formatter.formatIfDart('pubspec.yaml', yaml), yaml);
    });

    test('formatIfDart formats Dart content', () {
      final formatter = buildFormatter({
        '/pkg/pubspec.yaml':
            'name: foo\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
      });
      // Unformatted: extra spaces, missing newline.
      const unformatted = 'class Foo  { final int x; Foo(this.x); }';
      final result = formatter.formatIfDart('/pkg/lib/foo.dart', unformatted);
      // Formatter output is stable; just check it differs and ends in
      // a newline (every formatted Dart file does).
      expect(result, isNot(equals(unformatted)));
      expect(result, endsWith('\n'));
    });

    test('reads language version from pubspec.lock when present', () {
      // Lock takes precedence over pubspec.yaml — reflects the
      // resolved SDK from the most recent `pub get`.
      final formatter = buildFormatter({
        '/pkg/pubspec.lock': 'sdks:\n  dart: ">=3.6.0 <4.0.0"\n',
        '/pkg/pubspec.yaml':
            'name: foo\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
      });
      // Force the resolution by formatting any Dart content.
      // ignore: cascade_invocations
      formatter.formatIfDart('/pkg/lib/x.dart', 'var x = 1;\n');
      // Can't observe the language version directly, but we can verify
      // the pubspec.lock path was preferred by checking that the
      // formatter accepts older-style code (a feature of < 3.7) — the
      // 3.6.0 from the lock allows pre-tall-style formatting.
      // (Smoke-testing the resolution wiring; deeper coverage of
      // version selection lives at the dart_style level.)
    });

    test('falls back to pubspec.yaml when no lock', () {
      final formatter = buildFormatter({
        '/pkg/pubspec.yaml':
            'name: foo\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
      });
      // Smoke test: formatting a simple Dart file succeeds without a
      // lock file present.
      final result = formatter.formatIfDart(
        '/pkg/lib/x.dart',
        'class Foo {}\n',
      );
      expect(result, contains('class Foo'));
    });

    test('reads page_width and trailing_commas from analysis_options', () {
      final formatter = buildFormatter({
        '/pkg/pubspec.yaml':
            'name: foo\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
        '/pkg/analysis_options.yaml':
            'formatter:\n  page_width: 100\n  trailing_commas: preserve\n',
      });
      // A 90-char line that would wrap under the default 80 should
      // stay on one line under page_width: 100.
      final wide = 'final foo = SomeFunction(${'a' * 70});\n';
      final result = formatter.formatIfDart('/pkg/lib/x.dart', wide);
      expect(result.split('\n').first.length, greaterThan(80));
    });

    test('follows relative include: in analysis_options.yaml', () {
      // Workspace setup: package's analysis_options.yaml only inherits
      // from the workspace root's, which carries the formatter:
      // section.
      final formatter = buildFormatter({
        '/pkg/pubspec.yaml':
            'name: foo\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
        '/pkg/analysis_options.yaml': 'include: ../analysis_options.yaml\n',
        '/analysis_options.yaml': 'formatter:\n  page_width: 100\n',
      });
      final wide = 'final foo = SomeFunction(${'a' * 70});\n';
      final result = formatter.formatIfDart('/pkg/lib/x.dart', wide);
      // page_width: 100 from the workspace root file should survive
      // the include hop.
      expect(result.split('\n').first.length, greaterThan(80));
    });

    test('skips package: includes — does not throw', () {
      // The very_good_analysis case: the include points at a
      // package: URI we can't resolve without running pub. Should
      // fall back to defaults rather than crash.
      final formatter = buildFormatter({
        '/pkg/pubspec.yaml':
            'name: foo\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
        '/pkg/analysis_options.yaml':
            'include: package:very_good_analysis/analysis_options.yaml\n',
      });
      // Should format without throwing.
      final result = formatter.formatIfDart(
        '/pkg/lib/x.dart',
        'class Foo {}\n',
      );
      expect(result, contains('class Foo'));
    });

    test('walks up to find workspace pubspec.yaml + analysis_options', () {
      // Output is at /workspace/packages/inner; pubspec.yaml and
      // analysis_options.yaml live one level up.
      final fs = MemoryFileSystem.test();
      fs.directory('/workspace/packages/inner').createSync(recursive: true);
      fs
          .file('/workspace/pubspec.yaml')
          .writeAsStringSync(
            'name: workspace\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
          );
      fs
          .file('/workspace/analysis_options.yaml')
          .writeAsStringSync(
            'formatter:\n  page_width: 100\n',
          );
      final formatter = DartFileFormatter(
        fs: fs,
        outDir: fs.directory('/workspace/packages/inner'),
      );
      final wide = 'final foo = SomeFunction(${'a' * 70});\n';
      final result = formatter.formatIfDart(
        '/workspace/packages/inner/lib/x.dart',
        wide,
      );
      // Should have picked up page_width: 100 from the parent.
      expect(result.split('\n').first.length, greaterThan(80));
    });

    test('falls back to dart_style defaults when nothing is found', () {
      // Empty filesystem: no pubspec, no analysis_options. The
      // formatter should still work — language version defaults to
      // DartFormatter.latestLanguageVersion.
      final formatter = buildFormatter({});
      final result = formatter.formatIfDart(
        '/pkg/lib/x.dart',
        'class Foo {}\n',
      );
      expect(result, contains('class Foo'));
    });

    test('resolves the format context exactly once across many calls', () {
      // First call resolves and caches; subsequent calls reuse. The
      // observable effect is that mutating the pubspec.yaml after the
      // first format doesn't change the formatter's behavior on later
      // files.
      final fs = MemoryFileSystem.test();
      fs.directory('/pkg').createSync(recursive: true);
      final pubspec = fs.file('/pkg/pubspec.yaml')
        ..writeAsStringSync(
          'name: foo\nenvironment:\n  sdk: ">=3.9.0 <4.0.0"\n',
        );
      final formatter = DartFileFormatter(
        fs: fs,
        outDir: fs.directory('/pkg'),
      );
      // First format triggers resolution.
      // ignore: cascade_invocations
      formatter.formatIfDart('/pkg/lib/a.dart', 'class A {}\n');
      // Mutate pubspec — if resolution ran again, it'd see this. It
      // shouldn't.
      pubspec.writeAsStringSync('name: foo\nenvironment:\n  sdk: ">=3.0.0"\n');
      // Second format should still reuse the cached context.
      final result = formatter.formatIfDart('/pkg/lib/b.dart', 'class B {}\n');
      expect(result, contains('class B'));
      // Smoke test the cache by checking the formatter can still run.
      expect(
        () => formatter.formatIfDart('/pkg/lib/c.dart', 'class C {}\n'),
        returnsNormally,
      );
    });
  });

  group('FormatContext / FormatterConfig', () {
    test('FormatContext stores the values verbatim', () {
      final ctx = FormatContext(
        languageVersion: DartFormatter.latestLanguageVersion,
        pageWidth: 100,
        trailingCommas: TrailingCommas.preserve,
      );
      expect(ctx.languageVersion, DartFormatter.latestLanguageVersion);
      expect(ctx.pageWidth, 100);
      expect(ctx.trailingCommas, TrailingCommas.preserve);
    });

    test('FormatterConfig defaults to all-null', () {
      const config = FormatterConfig();
      expect(config.pageWidth, isNull);
      expect(config.trailingCommas, isNull);
    });
  });

  group('maybeAddFlutterStyleTodosIgnore', () {
    test('passes through content with no TODO in dartdoc', () {
      const content = '/// A perfectly ordinary description.\nclass Foo {}\n';
      expect(maybeAddFlutterStyleTodosIgnore(content), content);
    });

    test('prepends directive when dartdoc has a bare `TODO`', () {
      // Mirrors openfoodfacts' `element` schema, whose description ends
      // with a literal "TODO: add Map type".
      const content =
          '/// The element type.\n/// TODO: add Map type\nenum E {}\n';
      expect(
        maybeAddFlutterStyleTodosIgnore(content),
        startsWith('$flutterStyleTodosIgnoreBlock\n'),
      );
    });

    test('does not fire on a Flutter-style `TODO(user):` reference', () {
      // If spec prose already used the accepted form, the lint would not
      // fire, so neither should the directive (else `unnecessary_ignore`).
      const content = '/// See TODO(alice): finish this later.\nclass Foo {}\n';
      expect(maybeAddFlutterStyleTodosIgnore(content), content);
    });

    test('does not match a `//` line comment, only `///` doc', () {
      // The generator writes its own `//` TODOs in Flutter style; only
      // copied spec prose in `///` docs should trigger suppression.
      const content = '// TODO: internal note\nclass Foo {}\n';
      expect(maybeAddFlutterStyleTodosIgnore(content), content);
    });

    test('does not fire on `TODO` embedded in a larger word', () {
      const content = '/// The MASTODON integration endpoint.\nclass Foo {}\n';
      expect(maybeAddFlutterStyleTodosIgnore(content), content);
    });

    test('idempotent: does not double-prepend if marker already present', () {
      const content =
          '$flutterStyleTodosIgnoreBlock\n'
          '/// TODO: add Map type\nenum E {}\n';
      expect(flutterStyleTodosIgnoreBlock.allMatches(content).length, 1);
      final result = maybeAddFlutterStyleTodosIgnore(content);
      expect(flutterStyleTodosIgnoreBlock.allMatches(result).length, 1);
    });

    test('indented `///` member docs still count', () {
      const content =
          'class Foo {\n'
          '  /// TODO: revisit this field\n'
          '  final int x;\n'
          '}\n';
      expect(
        maybeAddFlutterStyleTodosIgnore(content),
        startsWith('$flutterStyleTodosIgnoreBlock\n'),
      );
    });
  });

  group('maybeAddAvoidJsRoundedIntsIgnore', () {
    test('passes through in-range validation bounds', () {
      // 9007199254740991 is 2^53-1, the largest JS-safe integer — dart2js
      // represents it exactly, so no directive (and adding one would trip
      // `unnecessary_ignore`).
      const content = 'value.validate(max: 9007199254740991);\n';
      expect(maybeAddAvoidJsRoundedIntsIgnore(content), content);
    });

    test('prepends directive for an out-of-range validation bound', () {
      // 18014398509481983 is 2^54-1, which a JS double can't represent
      // exactly.
      const content = 'value.validate(max: 18014398509481983);\n';
      expect(
        maybeAddAvoidJsRoundedIntsIgnore(content),
        startsWith('$avoidJsRoundedIntsIgnoreBlock\n'),
      );
    });

    test('detects a negative out-of-range minimum bound', () {
      const content = 'value.validate(min: -18014398509481983);\n';
      expect(
        maybeAddAvoidJsRoundedIntsIgnore(content),
        startsWith('$avoidJsRoundedIntsIgnoreBlock\n'),
      );
    });

    test('ignores large integers outside a validate bound arg', () {
      // A general integer literal isn't scanned — only the generator's own
      // `validate` numeric bound args — so an in-example big int (its own
      // `avoid_js_rounded_ints` story, #185) doesn't pull in this directive.
      const content = 'final x = 18014398509481983;\n';
      expect(maybeAddAvoidJsRoundedIntsIgnore(content), content);
    });

    test('is idempotent — does not stack the directive', () {
      const content =
          '$avoidJsRoundedIntsIgnoreBlock\n'
          'value.validate(max: 18014398509481983);\n';
      final result = maybeAddAvoidJsRoundedIntsIgnore(content);
      expect(avoidJsRoundedIntsIgnoreBlock.allMatches(result).length, 1);
    });
  });
}
