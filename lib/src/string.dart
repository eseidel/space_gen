/// Zero-width word boundaries inside a CamelCase identifier.
///
/// Two alternatives, which together treat a run of capitals as one
/// word rather than one word per letter:
///
/// - `(?<=[a-z0-9])(?=[A-Z])` — the ordinary case change, `fooBar`.
/// - `(?<=[A-Z])(?=[A-Z][a-z])` — the end of an acronym, splitting
///   `XMLHttp` into `XML` + `Http` by breaking before the last capital
///   of the run only when a lowercase letter follows it.
///
/// A capital run with nothing after it (`MACOS`) matches neither, so it
/// stays whole.
final _camelWordBoundary = RegExp(
  '(?<=[a-z0-9])(?=[A-Z])|(?<=[A-Z])(?=[A-Z][a-z])',
);

/// Convert CamelCase to snake_case.
///
/// Splits on word boundaries rather than before every capital, so
/// github's SCREAMING_CAPS property names (`MACOS`, `UBUNTU`) become
/// `macos` / `ubuntu` instead of `m_a_c_o_s` / `u_b_u_n_t_u`.
String snakeFromCamel(String camel) {
  final snake = camel.split(_camelWordBoundary).join('_').toLowerCase();
  // A leading underscore is dropped. Callers that compose a name as
  // `'${parent}_${snakeFromCamel(part)}'` would otherwise emit `__`
  // for github's `_links` properties — [toSnakeCase] collapses runs,
  // but the direct callers don't.
  return snake.startsWith('_') ? snake.substring(1) : snake;
}

/// Convert snake_case to CamelCase.
String camelFromSnake(String snake) {
  return snake.splitMapJoin(
    RegExp('_'),
    onMatch: (m) => '',
    onNonMatch: (n) => n.capitalizeFirst(),
  );
}

String lowercaseCamelFromSnake(String snake) =>
    camelFromSnake(snake).lowerFirst();

String toSnakeCase(String unknown) {
  // We don't know the casing the author used.
  // First replace whitespace runs with a single underscore — tag names
  // like "Payment Methods" or "Seller Account" arrive here verbatim
  // and would otherwise survive into generated class/file names as
  // `Payment MethodsApi`, which isn't valid Dart.
  // Dots get the same treatment: .NET-style specs declare schemas under
  // dotted namespace keys like `.App.Features.Order.Enums.Foo`, which
  // would otherwise land in generated code verbatim and fail to parse.
  final normalized = unknown.replaceAll(RegExp(r'[\s.]+'), '_');
  // Try to convert any UpperCase to snake_case.
  final lowered = snakeFromCamel(normalized);
  // Then convert any kebab-case to snake_case.
  final snake = snakeFromKebab(lowered);
  // "Payment Methods" → "Payment_Methods" → snakeFromCamel splits at
  // each uppercase, producing "payment__methods". Collapse the double
  // underscore (and any others the input introduced) to a single one.
  final collapsed = snake.replaceAll(RegExp('_+'), '_');
  // A leading dot (`.App.Features.X`) normalizes to a leading underscore;
  // strip it so snake names don't start with `_` (which makes generated
  // file/identifier names private and reads as noise).
  return collapsed.startsWith('_') ? collapsed.substring(1) : collapsed;
}

/// Convert kebab-case to snake_case.
String snakeFromKebab(String kebab) => kebab.replaceAll('-', '_');

/// Characters that carry a conventional ASCII spelling, mapped to it so
/// identifier sanitization yields a readable name instead of dropping the
/// character (which leaves collisions for the enum-dedup pass to paper over
/// with numeric suffixes: `g` and `mug` beat `g` and `g2`).
///
/// Dart identifiers are ASCII-only — a raw `μg` is `illegal_character`, not
/// a valid name (https://github.com/dart-lang/language/issues/1283) — so
/// some ASCII rewrite is mandatory; this just makes it a meaningful one.
///
/// Keyed by the character's *name*, not a domain reading — Greek `μ`
/// (mu) becomes `mu`, never the units interpretation `micro`, so one table
/// serves every spec. Only word- and unit-forming characters belong here:
/// separators like `&`/`@`/`#` are deliberately left to the `_` catch-all
/// in `variableSafeName`, since spelling them out in place would run
/// together the words they divide.
///
/// Each replacement mirrors the source character's case — lowercase `μ` ->
/// `mu`, uppercase `Δ` -> `Delta`, symbols with no case (`°`, `%`) go
/// lowercase.
/// Case is preserved rather than lowercased because `variableSafeName` has
/// a `preserveCase` mode (the SCREAMING_CAPS-enum quirk) where casing is
/// meaningful: a spec may use `Δ` and `δ` as distinct enum values, and
/// collapsing both to `delta` would fabricate a collision.
///
/// Greek mu (U+03BC) and the micro sign (U+00B5) look identical but are
/// distinct code points; both are listed, tagged with their Unicode name.
const Map<String, String> asciiTransliterations = {
  // Greek letters, by letter name.
  'α': 'alpha', 'β': 'beta', 'γ': 'gamma', 'δ': 'delta',
  'ε': 'epsilon', 'ζ': 'zeta', 'η': 'eta', 'θ': 'theta',
  'ι': 'iota', 'κ': 'kappa', 'λ': 'lambda',
  'μ': 'mu', // GREEK SMALL LETTER MU
  'ν': 'nu', 'ξ': 'xi', 'ο': 'omicron', 'π': 'pi',
  'ρ': 'rho', 'σ': 'sigma', 'ς': 'sigma', 'τ': 'tau',
  'υ': 'upsilon', 'φ': 'phi', 'χ': 'chi', 'ψ': 'psi',
  'ω': 'omega',
  'Δ': 'Delta', 'Σ': 'Sigma', 'Π': 'Pi', 'Ω': 'Omega',
  'Φ': 'Phi', 'Θ': 'Theta', 'Λ': 'Lambda', 'Ξ': 'Xi',
  'Ψ': 'Psi', 'Γ': 'Gamma',
  // Unit symbols, by name.
  'µ': 'mu', // MICRO SIGN (looks like Greek mu; same spelling)
  '°': 'degree', // DEGREE SIGN
  '%': 'percent',
  // Accented Latin (Latin-1 Supplement) folded to the base letter.
  'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a',
  'å': 'a', 'æ': 'ae', 'ç': 'c', 'è': 'e', 'é': 'e',
  'ê': 'e', 'ë': 'e', 'ì': 'i', 'í': 'i', 'î': 'i',
  'ï': 'i', 'ñ': 'n', 'ò': 'o', 'ó': 'o', 'ô': 'o',
  'õ': 'o', 'ö': 'o', 'ø': 'o', 'ù': 'u', 'ú': 'u',
  'û': 'u', 'ü': 'u', 'ý': 'y', 'ÿ': 'y', 'ß': 'ss',
  'À': 'A', 'Á': 'A', 'Â': 'A', 'Ã': 'A', 'Ä': 'A',
  'Å': 'A', 'Æ': 'AE', 'Ç': 'C', 'È': 'E', 'É': 'E',
  'Ê': 'E', 'Ë': 'E', 'Ì': 'I', 'Í': 'I', 'Î': 'I',
  'Ï': 'I', 'Ñ': 'N', 'Ò': 'O', 'Ó': 'O', 'Ô': 'O',
  'Õ': 'O', 'Ö': 'O', 'Ø': 'O', 'Ù': 'U', 'Ú': 'U',
  'Û': 'U', 'Ü': 'U', 'Ý': 'Y',
};

/// Replace each character in [value] that has a conventional ASCII spelling
/// (see [asciiTransliterations]) with that spelling, leaving every other
/// character untouched. `µg` -> `mug`, `café` -> `cafe`.
String transliterateToAscii(String value) {
  final buffer = StringBuffer();
  for (final rune in value.runes) {
    final ch = String.fromCharCode(rune);
    buffer.write(asciiTransliterations[ch] ?? ch);
  }
  return buffer.toString();
}

/// Converts from SCREAMING_CAPS, snake_case or kebab-case to camelCase.
String toLowerCamelCase(String caps) {
  // Our SCREAMING_CAPS logic is not safe for camelCase input,
  // so we check for it first.
  final isScreamingCaps = RegExp(r'^[A-Z0-9_]+$').hasMatch(caps);
  if (!isScreamingCaps) {
    final snake = snakeFromKebab(caps);
    // Still convert snake_case to camelCase.
    if (snake.contains('_')) {
      return lowercaseCamelFromSnake(snake);
    }
    return caps.lowerFirst();
  }
  // SCREAMING_CAPS -> lowerCamelCase
  final camel = caps.splitMapJoin(
    RegExp('_'),
    onMatch: (m) => '',
    onNonMatch: (n) => n.toLowerCase().capitalizeFirst(),
  );
  return camel.lowerFirst();
}

/// Converts from SCREAMING_CAPS, snake_case or kebab-case to CamelCase.
String toUpperCamelCase(String snake) =>
    toLowerCamelCase(snake).capitalizeFirst();

bool isReservedWord(String word) {
  // Dart keywords (reserved, built-in identifiers, and contextual), plus
  // a handful of built-in type names that would shadow common types if
  // used as a variable name. See https://dart.dev/language/keywords.
  const reservedWords = {
    // Reserved words — can never be identifiers.
    'assert',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'do',
    'else',
    'enum',
    'extends',
    'false',
    'final',
    'finally',
    'for',
    'if',
    'in',
    'is',
    'new',
    'null',
    'rethrow',
    'return',
    'super',
    'switch',
    'this',
    'throw',
    'true',
    'try',
    'var',
    'void',
    'while',
    'with',
    // Built-in identifiers — reserved as type names / some contexts.
    'abstract',
    'as',
    'covariant',
    'deferred',
    'dynamic',
    'export',
    'extension',
    'external',
    'factory',
    'Function',
    'get',
    'implements',
    'import',
    'interface',
    'late',
    'library',
    'mixin',
    'operator',
    'part',
    'required',
    'set',
    'static',
    'typedef',
    // Contextual keywords.
    'async',
    'await',
    'hide',
    'of',
    'on',
    'show',
    'sync',
    'yield',
    // Built-in type names we want to avoid shadowing.
    'bool',
    'double',
    'int',
    'num',
  };
  return reservedWords.contains(word);
}

String quoteString(String string) {
  // Escape `\` first so we don't double-escape the backslashes added
  // by the `'`, `$`, `\n`, `\r` escapes below. `$` needs escaping
  // because Dart single-quoted strings interpolate on `$` (regex
  // patterns like `^(0|[1-9][0-9]*)$` would otherwise be a syntax
  // error). Newlines need escaping because Dart single-quoted strings
  // can't span multiple lines (some spec examples contain literal
  // `\n`s — github's `codeowners-errors.errors[].message` is a
  // formatted multi-line string).
  final escaped = string
      .replaceAll(r'\', r'\\')
      .replaceAll("'", r"\'")
      .replaceAll(r'$', r'\$')
      .replaceAll('\n', r'\n')
      .replaceAll('\r', r'\r');
  return "'$escaped'";
}

extension CapitalizeString on String {
  String capitalizeFirst() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String lowerFirst() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toLowerCase()}${substring(1)}';
  }
}

/// This is a special case which just tries to use the first segment of a
/// snake_case name as the prefix.
String sharedPrefixFromSnakeNames(List<String> values) {
  final prefix = '${values.first.split('_').first}_';
  for (final value in values) {
    if (!value.startsWith(prefix)) {
      return '';
    }
  }
  return prefix;
}
