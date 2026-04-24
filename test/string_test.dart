import 'package:space_gen/src/string.dart';
import 'package:test/test.dart';

void main() {
  test('snakeFromCamel', () {
    expect(snakeFromCamel('snakeFromCamel'), 'snake_from_camel');
    expect(snakeFromCamel('SnakeFromCamel'), 'snake_from_camel');
    expect(snakeFromCamel('snake_from_camel'), 'snake_from_camel');
    expect(snakeFromCamel('Snake_from_camel'), 'snake_from_camel');
    expect(snakeFromCamel('snakeFromCamel'), 'snake_from_camel');
  });

  test('toSnakeCase', () {
    expect(toSnakeCase('snakeFromCamel'), 'snake_from_camel');
    expect(toSnakeCase('SnakeFromCamel'), 'snake_from_camel');
    expect(toSnakeCase('snake_from_camel'), 'snake_from_camel');
    expect(toSnakeCase('Snake_from_camel'), 'snake_from_camel');
    expect(toSnakeCase('snakeFromCamel'), 'snake_from_camel');
    expect(toSnakeCase('snake-from-camel'), 'snake_from_camel');
    // Tag names with spaces (common in real specs) must normalize to a
    // single underscore so downstream camel/pascal conversion produces
    // legal Dart identifiers.
    expect(toSnakeCase('Two Words'), 'two_words');
    expect(toSnakeCase('Four More Words Here'), 'four_more_words_here');
    expect(toSnakeCase('Multi   Space'), 'multi_space');
    expect(toSnakeCase('Tab\tSeparated'), 'tab_separated');
  });

  test('camelFromSnake', () {
    expect(camelFromSnake('camel_from_snake'), 'CamelFromSnake');
    expect(camelFromSnake('Camel_from_snake'), 'CamelFromSnake');
    expect(camelFromSnake('camel_from_snake'), 'CamelFromSnake');
    expect(camelFromSnake('Camel_from_snake'), 'CamelFromSnake');
  });

  test('toLowerCamelCase', () {
    expect(toLowerCamelCase('CAMEL_FROM_CAPS'), 'camelFromCaps');
    expect(toLowerCamelCase('camel_from_caps'), 'camelFromCaps');
    expect(toLowerCamelCase('camelFromCaps'), 'camelFromCaps');
    expect(toLowerCamelCase('camel-from-caps'), 'camelFromCaps');
  });

  test('isReservedWord', () {
    // Built-in type names.
    expect(isReservedWord('void'), true);
    expect(isReservedWord('int'), true);
    expect(isReservedWord('double'), true);
    expect(isReservedWord('num'), true);
    expect(isReservedWord('bool'), true);
    expect(isReservedWord('dynamic'), true);
    // Reserved keywords that were previously missing.
    expect(isReservedWord('try'), true);
    expect(isReservedWord('class'), true);
    expect(isReservedWord('return'), true);
    expect(isReservedWord('switch'), true);
    expect(isReservedWord('catch'), true);
    expect(isReservedWord('const'), true);
    expect(isReservedWord('finally'), true);
    // Previously-covered keywords.
    expect(isReservedWord('new'), true);
    expect(isReservedWord('null'), true);
    expect(isReservedWord('in'), true);
    expect(isReservedWord('required'), true);
    expect(isReservedWord('yield'), true);
    // Non-keywords.
    expect(isReservedWord('String'), false);
    expect(isReservedWord('string'), false);
    expect(isReservedWord('foo'), false);
  });
}
