import 'package:space_gen/src/parser.dart';
import 'package:space_gen/src/spec.dart';
import 'package:space_gen/src/visitor.dart';
import 'package:test/test.dart';

class _CountingVisitor extends Visitor {
  _CountingVisitor();
  final Map<String, int> _counts = {};

  void count(String name) {
    _counts[name] = (_counts[name] ?? 0) + 1;
  }

  @override
  void visitRoot(OpenApi root) => count('root');

  @override
  void visitSchema(SchemaBase schema) => count('schema');

  @override
  void visitParameter(Parameter parameter) => count('parameter');

  @override
  void visitRequestBody(RequestBody requestBody) => count('requestBody');

  @override
  void visitResponse(Response response) => count('response');

  @override
  void visitHeader(Header header) => count('header');

  @override
  void visitPathItem(PathItem pathItem) => count('pathItem');

  @override
  void visitOperation(Operation operation) => count('operation');

  @override
  void visitReference<T>(RefOr<T> ref) => count('reference');
}

void main() {
  test('SpecWalker smoke test', () {
    final spec = {
      'openapi': '3.0.0',
      'info': {'title': 'Test', 'version': '1.0.0'},
      'servers': [
        {'url': 'https://example.com'},
      ],
      'paths': {
        '/test': {
          'get': {
            'responses': {
              '200': {'description': 'OK'},
            },
          },
        },
      },
      'components': {
        'schemas': {
          'Test': {
            'type': 'object',
            'properties': {
              'foo': {'type': 'string'},
            },
          },
        },
        'parameters': {
          'Test': {
            'name': 'Test',
            'in': 'query',
            'required': true,
            'schema': {
              'type': 'object',
              'properties': {
                'foo': {'type': 'string'},
              },
            },
          },
        },
        'requestBodies': {
          'Test': {
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'properties': {
                    'foo': {'type': 'string'},
                  },
                },
              },
            },
          },
        },
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {
                  'type': 'object',
                  'properties': {
                    'foo': {'type': 'string'},
                  },
                },
              },
            },
          },
        },
        'headers': {
          'Test': {
            'description': 'Test',
            'schema': {'type': 'string'},
          },
        },
      },
    };
    final parsed = parseOpenApi(spec);
    final visitor = _CountingVisitor();
    SpecWalker(visitor).walkRoot(parsed);
    expect(visitor._counts, {
      'root': 1,
      'pathItem': 1,
      'operation': 1,
      'reference': 9,
      'response': 2,
      'schema': 9,
      'parameter': 1,
      'requestBody': 1,
      'header': 1,
    });
  });
}
