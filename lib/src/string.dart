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
    onNonMatch: (n) => n.capitalize(),
  );
}

String lowercaseCamelFromSnake(String snake) {
  final camel = camelFromSnake(snake);
  return camel[0].toLowerCase() + camel.substring(1);
}

String toSnakeCase(String unknown) {
  // We don't know the casing the author used.
  // First try to convert any UpperCase to snake_case.
  final lowered = snakeFromCamel(unknown);
  // Then convert any kebab-case to snake_case.
  return snakeFromKebab(lowered);
}

/// Convert kebab-case to snake_case.
String snakeFromKebab(String kebab) => kebab.replaceAll('-', '_');

/// Converts from SCREAMING_CAPS to camelCase.
String camelFromScreamingCaps(String caps) {
  final camel = caps.splitMapJoin(
    RegExp('_'),
    onMatch: (m) => '',
    onNonMatch: (n) => n.toLowerCase().capitalize(),
  );
  return camel[0].toLowerCase() + camel.substring(1);
}

bool isReservedWord(String word) {
  // Eventually we should add them all:
  // https://dart.dev/language/keywords
  const reservedWords = {
    'bool',
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
    'void',
    'yield',
  };
  return reservedWords.contains(word);
}

String quoteString(String string) {
  return "'${string.replaceAll("'", r"\'")}'";
}

extension CapitalizeString on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
