// Convert CamelCase to snake_case
String snakeFromCamel(String camel) {
  final snake = camel.splitMapJoin(
    RegExp('[A-Z]'),
    onMatch: (m) => '_${m.group(0)}'.toLowerCase(),
    onNonMatch: (n) => n.toLowerCase(),
  );
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
  return "'${string.replaceAll("'", r"\'")}'";
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
