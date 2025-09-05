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
  // First try to convert any UpperCase to snake_case.
  final lowered = snakeFromCamel(unknown);
  // Then convert any kebab-case to snake_case.
  final kebabConverted = snakeFromKebab(lowered);
  // Finally convert any spaces to underscores.
  return kebabConverted.replaceAll(' ', '_');
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
  // Eventually we should add them all:
  // https://dart.dev/language/keywords
  const reservedWords = {
    'bool',
    'case',
    'default',
    'double',
    'dynamic',
    'false',
    'int',
    'new',
    'null',
    'num',
    'required',
    'true',
    'try',
    'void',
    'with',
    'yield',
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
