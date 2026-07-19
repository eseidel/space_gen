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

  test('snakeFromCamel treats a run of capitals as one word', () {
    // github declares properties in SCREAMING_CAPS; splitting before
    // every capital produced `workflow_usage_billable_m_a_c_o_s` (#207).
    expect(snakeFromCamel('MACOS'), 'macos');
    expect(
      snakeFromCamel('WorkflowUsageBillableMACOS'),
      'workflow_usage_billable_macos',
    );
    // An acronym followed by a word breaks before the last capital of
    // the run, not after it.
    expect(snakeFromCamel('XMLHttpRequest'), 'xml_http_request');
    expect(snakeFromCamel('IOError'), 'io_error');
    // A trailing acronym and a two-letter one both stay whole.
    expect(snakeFromCamel('userID'), 'user_id');
    expect(snakeFromCamel('ID'), 'id');
    // Digits do not start a new word, but a capital after one does.
    expect(snakeFromCamel('Types200Response'), 'types200_response');
    expect(snakeFromCamel('HTTPCode2'), 'http_code2');
    // Degenerate inputs.
    expect(snakeFromCamel('A'), 'a');
    expect(snakeFromCamel(''), '');
  });

  test('snakeFromCamel drops a leading underscore', () {
    // github declares `_links` properties. Direct callers compose
    // `'${parent}_${snakeFromCamel(part)}'`, so keeping the leading
    // underscore would yield `pull_request__links`. Regression guard:
    // toSnakeCase collapses `_+`, but these callers do not.
    expect(snakeFromCamel('_links'), 'links');
    expect(snakeFromCamel('_Links'), 'links');
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
    // .NET / NSwag-style dotted schema keys must normalize the same way
    // whitespace does — otherwise the dots survive into Dart type names.
    expect(toSnakeCase('App.Features.Order'), 'app_features_order');
    expect(
      toSnakeCase('.App.Features.Marketplace.Order.Enums.OrderTimelineEvent'),
      'app_features_marketplace_order_enums_order_timeline_event',
    );
    expect(toSnakeCase('Foo..Bar'), 'foo_bar');
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
