// Convert CamelCase to snake_case
String snakeFromCamel(String camel) {
  final snake = camel.splitMapJoin(
    RegExp('[A-Z]'),
    onMatch: (m) => '_${m.group(0)}'.toLowerCase(),
    onNonMatch: (n) => n.toLowerCase(),
  );
  return snake.startsWith('_') ? snake.substring(1) : snake;
}

extension CapitalizeString on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
