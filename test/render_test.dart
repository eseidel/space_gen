import 'dart:convert';
import 'dart:io';
import 'dart:mirrors';

import 'package:file/local.dart';
import 'package:file/memory.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

class _EmptyClass {}

void main() {
  group('loadAndRenderSpec', () {
    const localFs = LocalFileSystem();
    // https://github.com/dart-lang/test/issues/110
    final templatesUri = (reflectClass(_EmptyClass).owner! as LibraryMirror).uri
        .resolve('../lib/templates');
    final templateDir = localFs.directory(templatesUri.path);

    ProcessResult runProcess(
      String executable,
      List<String> arguments, {
      String? workingDirectory,
    }) {
      return ProcessResult(0, 0, '', '');
    }

    test('deletes existing output directory', () async {
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');
      final spec = fs.file('test/spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(
          jsonEncode({
            'servers': [
              {'url': 'https://api.spacetraders.io/v2'},
            ],
            'paths': {
              '/users': {
                'get': {'summary': 'Get user'},
              },
            },
          }),
        );
      final spuriousFile = out.childFile('foo.txt')
        ..createSync(recursive: true);
      expect(spuriousFile.existsSync(), isTrue);
      final logger = _MockLogger();
      await runWithLogger(
        logger,
        () => loadAndRenderSpec(
          specUri: Uri.file(spec.path),
          packageName: 'spacetraders',
          outDir: out,
          templateDir: templateDir,
          runProcess: runProcess,
        ),
      );
      expect(spuriousFile.existsSync(), isFalse);
      expect(out.childFile('lib/api.dart').existsSync(), isTrue);
      expect(out.childFile('lib/api_client.dart').existsSync(), isTrue);
    });

    test('empty spec throws format exception', () async {
      final fs = MemoryFileSystem.test();
      final spec = fs.file('test/spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync('{}');
      final out = fs.directory('spacetraders');

      final logger = _MockLogger();
      await expectLater(
        () => runWithLogger(
          logger,
          () => loadAndRenderSpec(
            specUri: Uri.file(spec.path),
            packageName: 'spacetraders',
            outDir: out,
          ),
        ),
        throwsA(isA<FormatException>()),
      );
    });

    test('smoke test with simple spec', () async {
      final fs = MemoryFileSystem.test();
      final spec = fs.file('test/spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(
          jsonEncode({
            'servers': [
              {'url': 'https://api.spacetraders.io/v2'},
            ],
            'paths': {
              '/users': {
                'get': {'summary': 'Get user'},
              },
            },
          }),
        );
      final out = fs.directory('spacetraders');

      final logger = _MockLogger();

      await runWithLogger(
        logger,
        () => loadAndRenderSpec(
          specUri: Uri.file(spec.path),
          packageName: 'spacetraders',
          outDir: out,
          templateDir: templateDir,
          runProcess: runProcess,
        ),
      );
      expect(out.existsSync(), isTrue);
      expect(out.childFile('lib/api.dart').existsSync(), isTrue);
      expect(out.childFile('lib/api_client.dart').existsSync(), isTrue);
    });

    test('with real endpoints', () async {
      final fs = MemoryFileSystem.test();
      final spec = fs.file('test/spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(
          jsonEncode({
            'servers': [
              {'url': 'https://api.spacetraders.io/v2'},
            ],
            'paths': {
              '/users/{name}': {
                'get': {
                  'operationId': 'get-user',
                  'summary': 'Get User',
                  'description': 'Fetch a user by name.',
                  'parameters': [
                    {
                      'schema': {'type': 'string'},
                      'in': 'path',
                      'name': 'name',
                      'required': true,
                      'description': 'The name of the user to fetch.',
                    },
                  ],
                  'responses': {
                    '200': {
                      'description': 'Default Response',
                      'content': {
                        'application/json': {
                          'schema': {
                            'type': 'object',
                            'properties': {
                              'data': {r'$ref': '#/components/schemas/Account'},
                            },
                            'required': ['data'],
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            'components': {
              'schemas': {
                'Account': {
                  'type': 'object',
                  'properties': {
                    'role': {
                      'type': 'string',
                      'enum': ['admin', 'user'],
                      'description': 'The role of the account.',
                    },
                    'id': {'type': 'string'},
                    'email': {'type': 'string', 'nullable': true},
                  },
                  'required': ['role', 'id'],
                },
              },
            },
          }),
        );
      final out = fs.directory('spacetraders');

      final logger = _MockLogger();

      await runWithLogger(
        logger,
        () => loadAndRenderSpec(
          specUri: Uri.file(spec.path),
          packageName: 'spacetraders',
          outDir: out,
          templateDir: templateDir,
          runProcess: runProcess,
        ),
      );
      expect(out.existsSync(), isTrue);
      expect(out.childFile('lib/api.dart').existsSync(), isTrue);
      expect(out.childFile('lib/api_client.dart').existsSync(), isTrue);
      expect(out.childFile('lib/api/default_api.dart').existsSync(), isTrue);
      expect(
        out.childFile('lib/model/get_user200_response.dart').existsSync(),
        isTrue,
      );
      expect(out.childFile('lib/model/account.dart').existsSync(), isTrue);
      expect(out.childFile('lib/model/account_role.dart').existsSync(), isTrue);
    });

    test('with request body', () async {
      final fs = MemoryFileSystem.test();
      final spec = fs.file('test/spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(
          jsonEncode({
            'servers': [
              {'url': 'https://api.spacetraders.io/v2'},
            ],
            'paths': {
              '/my/ships/{shipSymbol}/purchase': {
                'post': {
                  'operationId': 'purchase-cargo',
                  'summary': 'Purchase Cargo',
                  'tags': ['Fleet'],
                  'description': 'Purchase cargo from a market.',
                  'requestBody': {
                    'content': {
                      'application/json': {
                        'schema': {
                          'type': 'object',
                          'properties': {
                            'symbol': {
                              'type': 'string',
                              'description':
                                  'The symbol of the good to purchase.',
                            },
                            'units': {
                              'type': 'integer',
                              'minimum': 1,
                              'description':
                                  'The number of units of the good to purchase.',
                            },
                          },
                          'required': ['symbol', 'units'],
                          'title': 'Purchase Cargo Request',
                        },
                      },
                    },
                    'required': true,
                  },
                  'parameters': [
                    {
                      'schema': {'type': 'string'},
                      'in': 'path',
                      'name': 'shipSymbol',
                      'required': true,
                      'description': 'The symbol of the ship.',
                    },
                  ],
                  'responses': {
                    '201': {
                      'description': 'Purchased goods successfully.',
                      'content': {
                        'application/json': {
                          'schema': {
                            'type': 'object',
                            'properties': {
                              'data': {
                                'type': 'object',
                                'properties': {
                                  'cargo': {
                                    'type': 'object',
                                    'properties': {
                                      'units': {
                                        'type': 'integer',
                                        'description': 'The number of units.',
                                      },
                                    },
                                  },
                                },
                                'required': ['cargo'],
                              },
                            },
                            'required': ['data'],
                            'title': 'Purchase Cargo 201 Response',
                            'description': 'Purchased goods successfully.',
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          }),
        );

      final out = fs.directory('spacetraders');

      final logger = _MockLogger();

      await runWithLogger(
        logger,
        () => loadAndRenderSpec(
          specUri: Uri.file(spec.path),
          packageName: 'spacetraders',
          outDir: out,
          templateDir: templateDir,
          runProcess: runProcess,
        ),
      );
      expect(out.existsSync(), isTrue);
      expect(out.childFile('lib/api.dart').existsSync(), isTrue);
      expect(out.childFile('lib/api_client.dart').existsSync(), isTrue);
      expect(out.childFile('lib/api/fleet_api.dart').existsSync(), isTrue);
      expect(
        out.childFile('lib/model/purchase_cargo201_response.dart').existsSync(),
        isTrue,
      );
      expect(
        out.childFile('lib/model/purchase_cargo_request.dart').existsSync(),
        isTrue,
      );
    });

    test('with newtype', () async {
      final fs = MemoryFileSystem.test();
      final spec = fs.file('test/spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(
          jsonEncode({
            'servers': [
              {'url': 'https://api.spacetraders.io/v2'},
            ],
            'paths': {
              '/users': {
                'get': {
                  'operationId': 'get-user',
                  'summary': 'Get User',
                  'description': 'Fetch a user by name.',
                  'parameters': [
                    {
                      'schema': {'type': 'string'},
                      'in': 'query',
                      'name': 'id',
                      'required': true,
                      'description': 'The role of the user to fetch.',
                    },
                  ],
                  'responses': {
                    '200': {
                      'description': 'Default Response',
                      'content': {
                        'application/json': {
                          'schema': {
                            'type': 'object',
                            'properties': {
                              'user': {r'$ref': '#/components/schemas/User'},
                              'multiplier': {
                                r'$ref': '#/components/schemas/Multiplier',
                              },
                            },
                            'required': ['user', 'multiplier'],
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
            'components': {
              'schemas': {
                'User': {'type': 'string'},
                'Multiplier': {'type': 'number'},
              },
            },
          }),
        );
      final out = fs.directory('spacetraders');

      final logger = _MockLogger();

      await runWithLogger(
        logger,
        () => loadAndRenderSpec(
          specUri: Uri.file(spec.path),
          packageName: 'spacetraders',
          outDir: out,
          templateDir: templateDir,
          runProcess: runProcess,
        ),
      );
      expect(out.childFile('lib/model/user.dart').existsSync(), isTrue);
      expect(out.childFile('lib/model/multiplier.dart').existsSync(), isTrue);
    });
  });
}
