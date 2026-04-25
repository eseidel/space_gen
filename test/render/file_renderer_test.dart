import 'dart:convert';
import 'dart:io' as io;
import 'dart:mirrors';

import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:file/memory.dart';
import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';
import 'package:space_gen/src/render/file_renderer.dart';
import 'package:space_gen/src/render/render_tree.dart';
import 'package:space_gen/src/render/schema_renderer.dart';
import 'package:space_gen/src/render/templates.dart';
import 'package:space_gen/src/resolver.dart'; // for ResolvedSecurityRequirement
import 'package:space_gen/src/types.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

class _EmptyClass {}

class _Exists extends Matcher {
  const _Exists();

  @override
  bool matches(dynamic file, Map<dynamic, dynamic> matchState) {
    if (file is File) {
      return file.existsSync();
    }
    if (file is Directory) {
      return file.existsSync();
    }
    return false;
  }

  @override
  Description describe(Description description) => description.add('exists');
}

const exists = _Exists();

class _HasFiles extends CustomMatcher {
  _HasFiles(List<String> files)
    : super('has files', 'files', unorderedEquals(files));

  @override
  Object? featureValueOf(dynamic actual) {
    return (actual as Directory)
        .listSync()
        .whereType<File>()
        .map((e) => e.path.split('/').last)
        .toList();
  }
}

Matcher hasFiles(List<String> files) => _HasFiles(files);

/// Matches the union of files emitted under `lib/models/` and
/// `lib/messages/`, applied to the package root directory. Use this
/// when a test just cares "these schema files were generated" and
/// doesn't need to pin which of the two subdirectories each landed in.
class _HasGeneratedSchemaFiles extends CustomMatcher {
  _HasGeneratedSchemaFiles(List<String> files)
    : super(
        'has generated schema files (models + messages)',
        'files',
        unorderedEquals(files),
      );

  @override
  Object? featureValueOf(dynamic actual) {
    final out = actual as Directory;
    final names = <String>[];
    for (final subdir in const ['lib/models', 'lib/messages']) {
      final dir = out.childDirectory(subdir);
      if (!dir.existsSync()) continue;
      names.addAll(
        dir.listSync().whereType<File>().map((e) => e.path.split('/').last),
      );
    }
    return names;
  }
}

Matcher hasGeneratedSchemaFiles(List<String> files) =>
    _HasGeneratedSchemaFiles(files);

/// Test-only [FileRenderer] subclass that exercises the
/// `fileRendererBuilder` + `modelPath` extension surface by
/// redirecting every schema to `lib/custom/` regardless of type.
class _CustomLayoutRenderer extends FileRenderer {
  _CustomLayoutRenderer(super.config);

  @override
  String modelPath(LayoutContext context) =>
      'custom/${context.schema.snakeName}.dart';
}

/// True when any generated model or message file has been emitted under
/// the package root.
bool hasGeneratedSchemaDirs(Directory out) {
  for (final subdir in const ['lib/models', 'lib/messages']) {
    if (out.childDirectory(subdir).existsSync()) return true;
  }
  return false;
}

void main() {
  group('loadAndRenderSpec', () {
    const localFs = LocalFileSystem();
    // https://github.com/dart-lang/test/issues/110
    final templatesUri = (reflectClass(_EmptyClass).owner! as LibraryMirror).uri
        .resolve('../../lib/templates');
    final templatesDir = localFs.directory(templatesUri.path);

    io.ProcessResult runProcess(
      String executable,
      List<String> arguments, {
      String? workingDirectory,
    }) {
      return io.ProcessResult(0, 0, '', '');
    }

    Future<void> renderToDirectory({
      required Map<String, dynamic> spec,
      Directory? outDir,
      Logger? logger,
    }) async {
      final out = outDir ?? MemoryFileSystem.test().directory('spacetraders');
      final fs = out.fileSystem;
      final specFile = fs.file('spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(jsonEncode(spec));
      await runWithLogger(
        logger ?? _MockLogger(),
        () => loadAndRenderSpec(
          GeneratorConfig(
            specUrl: Uri.file(specFile.path),
            packageName: out.path.split('/').last,
            outDir: out,
            templatesDir: templatesDir,
            runProcess: runProcess,
            logSchemas: false,
          ),
        ),
      );
    }

    test('deletes existing output directory', () async {
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final extraApiFile = out.childFile('lib/api/spurious.dart')
        ..createSync(recursive: true);
      expect(extraApiFile.existsSync(), isTrue);
      final extraModelFile = out.childFile('lib/model/spurious.dart')
        ..createSync(recursive: true);
      expect(extraModelFile.existsSync(), isTrue);
      final extraRootFile = out.childFile('foo.txt')
        ..createSync(recursive: true);
      expect(extraRootFile.existsSync(), isTrue);
      final logger = _MockLogger();
      await renderToDirectory(spec: spec, outDir: out, logger: logger);
      expect(extraApiFile.existsSync(), isFalse);
      expect(extraModelFile.existsSync(), isFalse);
      expect(extraRootFile.existsSync(), isTrue); // Only delete dirs we make.
      expect(out.childFile('lib/api.dart'), exists);
      expect(out.childFile('lib/api_client.dart'), exists);
    });

    test('empty spec throws format exception', () async {
      await expectLater(
        () => renderToDirectory(spec: {}),
        throwsA(isA<FormatException>()),
      );
    });

    test(
      'default response schema is emitted even when no explicit status '
      'code references it',
      () async {
        final fs = MemoryFileSystem.test();
        final spec = {
          'openapi': '3.1.0',
          'info': {'title': 'Default', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://example.com'},
          ],
          'paths': {
            '/widgets': {
              'get': {
                'operationId': 'getWidget',
                'responses': {
                  '200': {
                    'description': 'OK',
                    'content': {
                      'application/json': {
                        'schema': {r'$ref': '#/components/schemas/Widget'},
                      },
                    },
                  },
                  'default': {
                    'description': 'Error',
                    'content': {
                      'application/json': {
                        'schema': {r'$ref': '#/components/schemas/Error'},
                      },
                    },
                  },
                },
              },
            },
          },
          'components': {
            'schemas': {
              'Widget': {
                'type': 'object',
                'properties': {
                  'name': {'type': 'string'},
                },
              },
              'Error': {
                'type': 'object',
                'properties': {
                  'message': {'type': 'string'},
                },
              },
            },
          },
        };
        final out = fs.directory('out');
        await renderToDirectory(spec: spec, outDir: out);
        // The `Error` schema is only referenced by `default:` — if the
        // renderer didn't walk default responses, it would be tree-shaken
        // and no file would be written for it.
        expect(out.childFile('lib/models/widget.dart').existsSync(), isTrue);
        expect(out.childFile('lib/models/error.dart').existsSync(), isTrue);
      },
    );

    test(
      'NXX range response schema is emitted even when no specific status '
      'code references it',
      () async {
        final fs = MemoryFileSystem.test();
        final spec = {
          'openapi': '3.1.0',
          'info': {'title': 'Range', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://example.com'},
          ],
          'paths': {
            '/widgets': {
              'get': {
                'operationId': 'getWidget',
                'responses': {
                  '200': {
                    'description': 'OK',
                    'content': {
                      'application/json': {
                        'schema': {r'$ref': '#/components/schemas/Widget'},
                      },
                    },
                  },
                  '5XX': {
                    'description': 'Server error',
                    'content': {
                      'application/json': {
                        'schema': {r'$ref': '#/components/schemas/Error'},
                      },
                    },
                  },
                },
              },
            },
          },
          'components': {
            'schemas': {
              'Widget': {
                'type': 'object',
                'properties': {
                  'name': {'type': 'string'},
                },
              },
              'Error': {
                'type': 'object',
                'properties': {
                  'message': {'type': 'string'},
                },
              },
            },
          },
        };
        final out = fs.directory('out');
        await renderToDirectory(spec: spec, outDir: out);
        // `Error` is only referenced by `5XX:` — if the renderer didn't
        // walk range responses it would be tree-shaken.
        expect(out.childFile('lib/models/widget.dart').existsSync(), isTrue);
        expect(out.childFile('lib/models/error.dart').existsSync(), isTrue);
      },
    );

    test(
      'default response as a ref to components.responses resolves and '
      'emits the referenced schema',
      () async {
        final fs = MemoryFileSystem.test();
        final spec = {
          'openapi': '3.1.0',
          'info': {'title': 'ResponseRef', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://example.com'},
          ],
          'paths': {
            '/widgets': {
              'get': {
                'operationId': 'getWidget',
                'responses': {
                  '200': {
                    'description': 'OK',
                    'content': {
                      'application/json': {
                        'schema': {r'$ref': '#/components/schemas/Widget'},
                      },
                    },
                  },
                  'default': {r'$ref': '#/components/responses/Error'},
                },
              },
            },
          },
          'components': {
            'schemas': {
              'Widget': {
                'type': 'object',
                'properties': {
                  'name': {'type': 'string'},
                },
              },
              'ErrorBody': {
                'type': 'object',
                'properties': {
                  'message': {'type': 'string'},
                },
              },
            },
            'responses': {
              'Error': {
                'description': 'Standard error',
                'content': {
                  'application/json': {
                    'schema': {r'$ref': '#/components/schemas/ErrorBody'},
                  },
                },
              },
            },
          },
        };
        final out = fs.directory('out');
        await renderToDirectory(spec: spec, outDir: out);
        expect(out.childFile('lib/models/widget.dart').existsSync(), isTrue);
        expect(
          out.childFile('lib/models/error_body.dart').existsSync(),
          isTrue,
        );
      },
    );

    test('round-trip tests are emitted next to each model', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Roundtrip', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/widgets': {
            'get': {
              'operationId': 'getWidget',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Widget'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Widget': {
              'type': 'object',
              'required': ['id', 'name'],
              'properties': {
                'id': {'type': 'integer', 'format': 'int64'},
                'name': {'type': 'string'},
              },
            },
          },
        },
      };
      final out = fs.directory('out');
      await renderToDirectory(spec: spec, outDir: out);
      final testFile = out.childFile('test/models/widget_test.dart');
      expect(testFile.existsSync(), isTrue);
      final body = testFile.readAsStringSync();
      expect(body, contains("import 'package:out/api.dart';"));
      expect(body, contains('Widget(id: 0, name: '));
      expect(body, contains('Widget.maybeFromJson(instance.toJson())'));
      expect(body, contains('Widget.maybeFromJson(null)'));
      expect(body, contains('parsed.hashCode'));
    });

    test('enum round-trip test exercises toString and every value', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'EnumRoundtrip', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/roles': {
            'get': {
              'operationId': 'getRole',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Role'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Role': {
              'type': 'string',
              'enum': ['admin', 'user'],
            },
          },
        },
      };
      final out = fs.directory('out');
      await renderToDirectory(spec: spec, outDir: out);
      final testFile = out.childFile('test/models/role_test.dart');
      expect(testFile.existsSync(), isTrue);
      final body = testFile.readAsStringSync();
      // Object schemas don't get these blocks; enums do.
      expect(body, contains('toString matches toJson for every value'));
      expect(body, contains('fromJson round-trips every value'));
      expect(body, contains('for (final value in Role.values)'));
      expect(body, contains('value.toString()'));
      expect(body, contains('Role.fromJson(value.toJson())'));
    });

    test('non-enum round-trip test omits the enum-only assertions', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'NoEnumExtras', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/widgets': {
            'get': {
              'operationId': 'getWidget',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Widget'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Widget': {
              'type': 'object',
              'required': ['id'],
              'properties': {
                'id': {'type': 'integer'},
              },
            },
          },
        },
      };
      final out = fs.directory('out');
      await renderToDirectory(spec: spec, outDir: out);
      final body = out
          .childFile('test/models/widget_test.dart')
          .readAsStringSync();
      expect(body, isNot(contains('toString matches toJson')));
      expect(body, isNot(contains('fromJson round-trips every value')));
    });

    test(
      'api.dart barrel re-exports third-party packages used by models',
      () async {
        // A model with a `format: uri-template` field uses `UriTemplate`
        // from `package:uri/uri.dart`. The model file imports that, but
        // Dart exports don't chain through imports — if the barrel only
        // re-exports the model class, consumers (incl. the generated
        // round-trip tests) can't write `UriTemplate('...')` without
        // adding their own `package:uri/uri.dart` import. Re-exporting
        // third-party packages from the barrel makes
        // `import 'package:pkg/api.dart';` cover every type mentioned
        // in a public field signature.
        final fs = MemoryFileSystem.test();
        final spec = {
          'openapi': '3.1.0',
          'info': {'title': 'UriTemplateTest', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://example.com'},
          ],
          'paths': {
            '/endpoints': {
              'get': {
                'operationId': 'getEndpoint',
                'responses': {
                  '200': {
                    'description': 'OK',
                    'content': {
                      'application/json': {
                        'schema': {
                          r'$ref': '#/components/schemas/Endpoint',
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
              'Endpoint': {
                'type': 'object',
                'required': ['href'],
                'properties': {
                  'href': {'type': 'string', 'format': 'uri-template'},
                },
              },
            },
          },
        };
        final out = fs.directory('out');
        await renderToDirectory(spec: spec, outDir: out);
        final barrel = out.childFile('lib/api.dart').readAsStringSync();
        expect(
          barrel,
          contains("export 'package:uri/uri.dart' show UriTemplate;"),
        );
        // `package:meta/meta.dart` is imported by every RenderObject for
        // `@immutable`, but without an explicit `shown:` list — it's
        // internal to the model file and shouldn't leak through the
        // barrel.
        expect(
          barrel,
          isNot(contains("export 'package:meta/meta.dart'")),
        );
        // `package:http/http.dart as http` is used in api files for
        // multipart uploads (prefix import). Prefix imports don't
        // translate to exports, so no re-export line.
        expect(
          barrel,
          isNot(contains("export 'package:http/http.dart'")),
        );
      },
    );

    test(
      'barrel does not re-export same-package or dart: entries',
      () async {
        // Sanity-check the remaining filter branches of the barrel
        // export collector. `package:<pkg>/models/*.dart` is already
        // re-exported via its own listing in the barrel (and should
        // not appear as a _third-party_ export). `dart:*` imports
        // (e.g. `dart:typed_data` from RenderBinary) never translate
        // to package: exports at all.
        final fs = MemoryFileSystem.test();
        final spec = {
          'openapi': '3.1.0',
          'info': {'title': 'SamePkgDartFilter', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://example.com'},
          ],
          'paths': {
            '/upload': {
              'post': {
                'operationId': 'upload',
                'requestBody': {
                  'required': true,
                  'content': {
                    'multipart/form-data': {
                      'schema': {
                        'type': 'object',
                        'required': ['file'],
                        'properties': {
                          'file': {'type': 'string', 'format': 'binary'},
                        },
                      },
                    },
                  },
                },
                'responses': {
                  '200': {'description': 'OK'},
                },
              },
            },
          },
        };
        final out = fs.directory('out');
        await renderToDirectory(spec: spec, outDir: out);
        final barrel = out.childFile('lib/api.dart').readAsStringSync();
        // Binary field pulls in `dart:typed_data` at schema level — must
        // not be re-exported (dart: is not a package:).
        expect(barrel, isNot(contains("'dart:typed_data'")));
        // Each export line in the barrel must be either for the
        // generated package itself or a third-party package with a
        // `show` clause. Nothing slips through unconditionally.
        for (final line
            in barrel.split('\n').where((l) => l.startsWith('export '))) {
          final isOwnPackage = line.contains(
            "export 'package:out/",
          );
          final isShownThirdParty = line.contains(' show ');
          expect(
            isOwnPackage || isShownThirdParty,
            isTrue,
            reason: 'Unexpected barrel export: $line',
          );
        }
      },
    );

    test('generateTests: false suppresses test emission', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'NoTests', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/widgets': {
            'get': {
              'operationId': 'getWidget',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Widget'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Widget': {
              'type': 'object',
              'required': ['id'],
              'properties': {
                'id': {'type': 'integer'},
              },
            },
          },
        },
      };
      final out = fs.directory('out');
      final specFile = fs.file('spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(jsonEncode(spec));
      await runWithLogger(
        _MockLogger(),
        () => loadAndRenderSpec(
          GeneratorConfig(
            specUrl: Uri.file(specFile.path),
            packageName: 'out',
            outDir: out,
            templatesDir: templatesDir,
            runProcess: runProcess,
            logSchemas: false,
            generateTests: false,
          ),
        ),
      );
      expect(out.childDirectory('test').existsSync(), isFalse);
    });

    test('smoke test with simple spec', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'summary': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final out = fs.directory('spacetraders');
      await renderToDirectory(spec: spec, outDir: out);
      expect(
        out.childDirectory('lib'),
        hasFiles([
          'api.dart',
          'api_exception.dart',
          'api_client.dart',
          'auth.dart',
          'client.dart',
          // model_helpers.dart is omitted because this spec has no
          // schemas and thus no helpers are referenced.
        ]),
      );

      // Read client.dart and check that the client class name is correct.
      final client = out.childFile('lib/client.dart');
      final clientContent = client.readAsStringSync();
      expect(
        clientContent,
        "import 'package:spacetraders/api.dart';\n"
        '\n'
        'class Space {\n'
        '  Space({ApiClient? client}) : client = client ?? ApiClient();\n'
        '\n'
        '  final ApiClient client;\n'
        '\n'
        '  DefaultApi get defaultApi => DefaultApi(client);\n'
        '}\n',
      );
    });

    test('with real endpoints', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
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
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.existsSync(), isTrue);
      expect(
        out.childDirectory('lib'),
        hasFiles([
          'api.dart',
          'api_exception.dart',
          'api_client.dart',
          'auth.dart',
          'client.dart',
          'model_helpers.dart',
        ]),
      );
      expect(out.childDirectory('lib/api'), hasFiles(['default_api.dart']));
      expect(
        out,
        hasGeneratedSchemaFiles([
          'get_user200_response.dart',
          'account.dart',
          'account_role.dart',
        ]),
      );
    });

    test('model_helpers.dart only includes helpers that are used', () async {
      // This spec has strings only — `parseFromJson` is the only helper
      // any generated file references. The date / uri / list / map
      // helpers should be pruned out.
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Test API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/thing': {
            'get': {
              'operationId': 'get-thing',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Thing'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Thing': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
              },
              'required': ['name'],
            },
          },
        },
      };
      final out = fs.directory('out');
      await renderToDirectory(spec: spec, outDir: out);
      final helpers = out
          .childFile('lib/model_helpers.dart')
          .readAsStringSync();
      expect(helpers, contains('parseFromJson'));
      expect(helpers, isNot(contains('maybeParseDateTime')));
      expect(helpers, isNot(contains('maybeParseUri')));
      expect(helpers, isNot(contains('listsEqual')));
      expect(helpers, isNot(contains('mapsEqual')));
      expect(helpers, isNot(contains('listHash')));
      expect(helpers, isNot(contains('mapHash')));
      expect(helpers, isNot(contains("import 'package:collection")));
      expect(helpers, isNot(contains("import 'package:uri/uri.dart")));
    });

    test('model_helpers.dart includes collection helpers for list/map '
        'properties', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Test API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/thing': {
            'get': {
              'operationId': 'get-thing',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Thing'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Thing': {
              'type': 'object',
              'properties': {
                'tags': {
                  'type': 'array',
                  'items': {'type': 'string'},
                },
                'createdAt': {'type': 'string', 'format': 'date-time'},
              },
              'required': ['tags', 'createdAt'],
            },
          },
        },
      };
      final out = fs.directory('out');
      await renderToDirectory(spec: spec, outDir: out);
      final helpers = out
          .childFile('lib/model_helpers.dart')
          .readAsStringSync();
      expect(helpers, contains('parseFromJson'));
      expect(helpers, contains('listsEqual'));
      expect(helpers, contains('listHash'));
      expect(helpers, contains("import 'package:collection/collection.dart"));
      // `createdAt` is required (non-nullable json), so DateTime.parse is
      // inlined at the call site — `maybeParseDateTime` stays pruned.
      expect(helpers, isNot(contains('maybeParseDateTime')));
    });

    test('with request body', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
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
                          'description': 'The symbol of the good to purchase.',
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
      };
      final out = fs.directory('spacetraders');

      File outFile(String path) => out.childFile(path);
      File apiFile(String path) =>
          out.childDirectory('lib/api').childFile(path);

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.existsSync(), isTrue);
      expect(outFile('lib/api.dart'), exists);
      expect(outFile('lib/api_client.dart'), exists);
      expect(apiFile('fleet_api.dart'), exists);
      expect(
        out,
        hasGeneratedSchemaFiles([
          'purchase_cargo_request.dart',
          'purchase_cargo201_response.dart',
          'purchase_cargo201_response_data.dart',
          'purchase_cargo201_response_data_cargo.dart',
        ]),
      );
    });

    test('with newtype', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
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
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(
        out,
        hasGeneratedSchemaFiles([
          'get_user200_response.dart',
          'user.dart',
          'multiplier.dart',
        ]),
      );
    });

    test('with default enum value', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
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
                        },
                        'required': ['user'],
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
            'User': {
              'type': 'string',
              'enum': ['admin', 'user'],
              // Special handling is needed when an enum is default.
              'default': 'user',
            },
          },
        },
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(
        out.childFile('lib/messages/get_user200_response.dart'),
        exists,
      );
      expect(out.childFile('lib/models/user.dart'), exists);
    });

    test('with additionalProperties', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'operationId': 'get-user',
              'summary': 'Get User',
              'description': 'Fetch a user by name.',
              'responses': {
                '200': {
                  'description': 'Default Response',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        // Makes this into a Map<String, String>
                        'additionalProperties': {'type': 'string'},
                      },
                    },
                  },
                },
              },
            },
          },
        },
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      // No schema files are needed for the Map.
      expect(hasGeneratedSchemaDirs(out), isFalse);
    });

    test('with inner types', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/my/factions': {
            'get': {
              'operationId': 'get-my-factions',
              'summary': 'Get My Factions',
              'description':
                  'Retrieve factions with which the agent has reputation.',
              'responses': {
                '200': {
                  'description': 'Default Response',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        'properties': {
                          'data': {
                            'type': 'array',
                            'items': {
                              'type': 'object',
                              'properties': {
                                'symbol': {'type': 'string'},
                                'reputation': {'type': 'integer'},
                              },
                              'required': ['symbol', 'reputation'],
                            },
                          },
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
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(
        out,
        hasGeneratedSchemaFiles([
          'get_my_factions200_response.dart',
          'get_my_factions200_response_data_inner.dart',
        ]),
      );
    });

    test('with request body ref', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/my/ships/{shipSymbol}/purchase': {
            'post': {
              'operationId': 'purchase-cargo',
              'requestBody': {
                r'$ref': '#/components/requestBodies/PurchaseCargoRequest',
              },
              'responses': {
                '201': {'description': 'Purchased goods successfully.'},
              },
            },
          },
        },
        'components': {
          'requestBodies': {
            'PurchaseCargoRequest': {
              'content': {
                'application/json': {
                  'schema': {
                    'type': 'object',
                    'properties': {
                      'symbol': {'type': 'string'},
                      'units': {'type': 'integer'},
                    },
                    'required': ['symbol', 'units'],
                  },
                },
              },
              'required': true,
            },
          },
        },
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(
        out,
        hasGeneratedSchemaFiles(['purchase_cargo_request.dart']),
      );
      expect(out.childFile('lib/api/default_api.dart'), exists);
    });

    test('with external schema ref', () async {
      // The root spec references a schema that lives in another file next
      // to it. Verifies that the external-ref loader pulls in `shared.json`
      // and registers `Widget` so the resolver can find it.
      final fs = MemoryFileSystem.test();
      final dir = fs.directory('/pkg')..createSync(recursive: true);
      dir
          .childFile('shared.json')
          .writeAsStringSync(
            jsonEncode({
              'components': {
                'schemas': {
                  'Widget': {
                    'type': 'object',
                    'required': ['id'],
                    'properties': {
                      'id': {'type': 'integer'},
                    },
                  },
                },
              },
            }),
          );
      final specFile = dir.childFile('spec.json')
        ..writeAsStringSync(
          jsonEncode({
            'openapi': '3.1.0',
            'info': {'title': 'Ext', 'version': '1.0.0'},
            'servers': [
              {'url': 'https://example.com'},
            ],
            'paths': {
              '/widgets': {
                'get': {
                  'operationId': 'getWidget',
                  'responses': {
                    '200': {
                      'description': 'OK',
                      'content': {
                        'application/json': {
                          'schema': {
                            r'$ref': 'shared.json#/components/schemas/Widget',
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
      final out = dir.childDirectory('out');
      await runWithLogger(
        _MockLogger(),
        () => loadAndRenderSpec(
          GeneratorConfig(
            specUrl: Uri.file(specFile.path),
            packageName: 'out',
            outDir: out,
            templatesDir: templatesDir,
            runProcess: runProcess,
            logSchemas: false,
            generateTests: false,
          ),
        ),
      );
      expect(out, hasGeneratedSchemaFiles(['widget.dart']));
    });

    test('with transitive external schema ref', () async {
      // Root spec refs a schema in `a.json`; that schema refs another in
      // `b.json`. Both have to be loaded and registered for resolution to
      // succeed.
      final fs = MemoryFileSystem.test();
      final dir = fs.directory('/pkg')..createSync(recursive: true);
      dir
          .childFile('b.json')
          .writeAsStringSync(
            jsonEncode({
              'components': {
                'schemas': {
                  'Inner': {
                    'type': 'object',
                    'required': ['name'],
                    'properties': {
                      'name': {'type': 'string'},
                    },
                  },
                },
              },
            }),
          );
      dir
          .childFile('a.json')
          .writeAsStringSync(
            jsonEncode({
              'components': {
                'schemas': {
                  'Outer': {
                    'type': 'object',
                    'required': ['inner'],
                    'properties': {
                      'inner': {r'$ref': 'b.json#/components/schemas/Inner'},
                    },
                  },
                },
              },
            }),
          );
      final specFile = dir.childFile('spec.json')
        ..writeAsStringSync(
          jsonEncode({
            'openapi': '3.1.0',
            'info': {'title': 'Ext', 'version': '1.0.0'},
            'servers': [
              {'url': 'https://example.com'},
            ],
            'paths': {
              '/things': {
                'get': {
                  'operationId': 'getThing',
                  'responses': {
                    '200': {
                      'description': 'OK',
                      'content': {
                        'application/json': {
                          'schema': {
                            r'$ref': 'a.json#/components/schemas/Outer',
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
      final out = dir.childDirectory('out');
      await runWithLogger(
        _MockLogger(),
        () => loadAndRenderSpec(
          GeneratorConfig(
            specUrl: Uri.file(specFile.path),
            packageName: 'out',
            outDir: out,
            templatesDir: templatesDir,
            runProcess: runProcess,
            logSchemas: false,
            generateTests: false,
          ),
        ),
      );
      expect(out, hasGeneratedSchemaFiles(['outer.dart', 'inner.dart']));
    });

    test('with boolean and unknown type', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'operationId': 'get-user',
              'responses': {
                '200': {
                  'description': 'Default Response',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        'properties': {
                          'foo': {'type': 'boolean', 'default': true},
                          'bar': {
                            // No type is unknown and renders as dynamic.
                            'description': 'A description',
                          },
                        },
                        'required': ['foo'],
                      },
                    },
                  },
                },
              },
            },
          },
        },
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.childDirectory('lib/api'), hasFiles(['default_api.dart']));
    });

    test('with datetime', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'operationId': 'get-user',
              'summary': 'Get User',
              'description': 'Fetch a user by name.',
              'responses': {
                '200': {
                  'description': 'Default Response',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        'properties': {
                          'foo': {'type': 'string', 'format': 'date-time'},
                          'bar': {'type': 'string', 'format': 'date-time'},
                        },
                        // Bar is a nullable datetime, foo is non-nullable.
                        'required': ['foo'],
                      },
                    },
                  },
                },
              },
            },
          },
        },
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(
        out,
        hasGeneratedSchemaFiles(['get_user200_response.dart']),
      );
    });

    test('with array', () async {
      final fs = MemoryFileSystem.test();
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/my/ships': {
            'get': {
              'operationId': 'get-my-ships',
              'responses': {
                '200': {
                  'description': 'Default Response',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        'properties': {
                          'foo': {
                            'type': 'array',
                            'items': {'type': 'string'},
                          },
                          'bar': {
                            'type': 'array',
                            'items': {'type': 'number'},
                          },
                          'baz': {
                            'type': 'array',
                            'items': {'type': 'integer'},
                          },
                          'qux': {
                            'type': 'array',
                            'items': {'type': 'boolean'},
                          },
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        },
      };
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.childFile('lib/api/default_api.dart'), exists);
      expect(
        out,
        hasGeneratedSchemaFiles(['get_my_ships200_response.dart']),
      );
    });

    test('in=cookie not supported', () async {
      Map<String, dynamic> withIn(String sendIn) {
        return {
          'openapi': '3.1.0',
          'info': {'title': 'Space Traders API', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://api.spacetraders.io/v2'},
          ],
          'paths': {
            '/users': {
              'get': {
                'summary': 'Get user',
                'parameters': [
                  {
                    'name': 'foo',
                    'schema': {'type': 'string'},
                    'in': sendIn,
                  },
                ],
                'responses': {
                  '200': {'description': 'OK'},
                },
              },
            },
          },
        };
      }

      await expectLater(renderToDirectory(spec: withIn('query')), completes);
      await expectLater(
        renderToDirectory(spec: withIn('cookie')),
        throwsA(
          isA<UnimplementedError>().having(
            (e) => e.toString(),
            'message',
            contains('Cookie parameters are not yet supported'),
          ),
        ),
      );
      await expectLater(renderToDirectory(spec: withIn('header')), completes);
    });

    test('responses without content are ignored', () async {
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.childFile('lib/api/default_api.dart'), exists);
      expect(hasGeneratedSchemaDirs(out), isFalse);
    });

    test(
      'render the first content type even if application/json is missing',
      () async {
        final spec = {
          'openapi': '3.1.0',
          'info': {'title': 'Space Traders API', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://api.spacetraders.io/v2'},
          ],
          'paths': {
            '/users': {
              'get': {
                'responses': {
                  '200': {
                    'description': 'OK',
                    'content': {
                      // Note lack of application/json
                      'application/xml': {
                        'schema': {
                          'type': 'object',
                          'properties': {
                            'foo': {'type': 'string'},
                          },
                          'required': ['foo'],
                        },
                      },
                    },
                  },
                },
              },
            },
          },
        };
        final fs = MemoryFileSystem.test();
        final out = fs.directory('spacetraders');

        await renderToDirectory(spec: spec, outDir: out);
        expect(out.childFile('lib/api/default_api.dart'), exists);
        expect(
          out,
          hasGeneratedSchemaFiles(['users200_response.dart']),
        );
      },
    );
    test('multiple responses with different content', () async {
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {'type': 'boolean'},
                    },
                  },
                },
                '201': {
                  'description': 'Created',
                  'content': {
                    'application/json': {
                      'schema': {'type': 'string'},
                    },
                  },
                },
              },
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.childFile('lib/api/default_api.dart'), exists);
      expect(
        out,
        hasGeneratedSchemaFiles(['users_response.dart']),
      );
    });
    test('empty object creates new file', () async {
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/empty-object'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'empty-object': {
              'title': 'Empty Object',
              'description': 'An object without any properties.',
              'type': 'object',
              'properties': <String, dynamic>{},
              'additionalProperties': false,
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.childFile('lib/models/empty_object.dart'), exists);
    });

    test('tag with kebab case', () async {
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'tags': ['foo-bar'],
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(out.childFile('lib/api/foo_bar_api.dart'), exists);
    });

    test('only render top level objects to unique files', () async {
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {
                        r'$ref': '#/components/schemas/workflow-usage',
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
            'workflow-usage': {
              'title': 'Workflow Usage',
              'description': 'Workflow Usage',
              'type': 'object',
              'properties': {
                'billable': {
                  'type': 'object',
                  'properties': {
                    'UBUNTU': {
                      'type': 'object',
                      'properties': {
                        'total_ms': {'type': 'integer'},
                      },
                    },
                    'MACOS': {
                      'type': 'object',
                      'properties': {
                        'total_ms': {'type': 'integer'},
                      },
                    },
                    'WINDOWS': {
                      'type': 'object',
                      'properties': {
                        'total_ms': {'type': 'integer'},
                      },
                    },
                  },
                },
              },
              'required': ['billable'],
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      // TODO(eseidel): This is wrong. We shouldn't render the nested objects.
      expect(
        out,
        hasGeneratedSchemaFiles([
          'workflow_usage.dart',
          'workflow_usage_billable.dart',
          'workflow_usage_billable_u_b_u_n_t_u.dart',
          'workflow_usage_billable_m_a_c_o_s.dart',
          'workflow_usage_billable_w_i_n_d_o_w_s.dart',
        ]),
      );
    });

    test('colliding names are renamed', () async {
      // This sort of collision happens in the GitHub spec.
      // e.g. #/components/schemas/code-scanning-variant-analysis/properties/status
      // and #/components/schemas/code-scanning-variant-analysis-status
      // Both result in CodeScanningVariantAnalysisStatus.
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        'properties': {
                          'user': {r'$ref': '#/components/schemas/user'},
                          'role': {r'$ref': '#/components/schemas/user-role'},
                        },
                        'required': ['user'],
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
            'user-role': {
              'type': 'string',
              'enum': ['admin', 'user'],
            },
            'user': {
              'type': 'object',
              'properties': {
                'role': {
                  'type': 'string',
                  'enum': ['role1', 'role2'],
                },
              },
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      await renderToDirectory(spec: spec, outDir: out);
      expect(
        out,
        hasGeneratedSchemaFiles([
          'users200_response.dart',
          'user.dart',
          'user_role.dart',
          'user_role_1.dart',
        ]),
      );
    });
    test('non-rendered types do not count as collisions', () async {
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Space Traders API', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'paths': {
          '/users': {
            'get': {
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {
                        'type': 'object',
                        'properties': {
                          'user': {r'$ref': '#/components/schemas/user'},
                          'role': {r'$ref': '#/components/schemas/user-role'},
                        },
                        'required': ['user'],
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
            'user': {
              'type': 'object',
              'properties': {
                'role': {
                  // This is not rendered separately due to being nested.
                  'type': 'string',
                },
              },
            },
            'user-role': {
              'type': 'string',
              'enum': ['admin', 'user'],
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      final logger = _MockLogger();
      await renderToDirectory(spec: spec, outDir: out, logger: logger);
      expect(
        out,
        hasGeneratedSchemaFiles([
          'users200_response.dart',
          'user.dart',
          'user_role.dart',
        ]),
      );
    });

    test('self-referential schema generates a recursive class', () async {
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Tree', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/root': {
            'get': {
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Node'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Node': {
              'type': 'object',
              'properties': {
                'value': {'type': 'string'},
                'left': {r'$ref': '#/components/schemas/Node'},
                'right': {r'$ref': '#/components/schemas/Node'},
              },
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('tree');

      await renderToDirectory(spec: spec, outDir: out);

      // Only one file for Node — the cycle-break refs don't emit their own.
      expect(out, hasGeneratedSchemaFiles(['node.dart']));

      final node = out.childFile('lib/models/node.dart').readAsStringSync();
      // Recursive fields typed as Node?.
      expect(node, contains('final Node? left;'));
      expect(node, contains('final Node? right;'));
      // toJson recurses via the standard newtype convention.
      expect(node, contains('left?.toJson()'));
      expect(node, contains('right?.toJson()'));
      // fromJson recurses via Node.maybeFromJson (nullable ref).
      expect(node, contains('Node.maybeFromJson'));
    });

    test('mutually-recursive schemas both generate', () async {
      // Foo -> bar: Bar -> foo: Foo forms a cycle going through two types.
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Mutual', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/root': {
            'get': {
              'operationId': 'getRoot',
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Foo'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Foo': {
              'type': 'object',
              'properties': {
                'bar': {r'$ref': '#/components/schemas/Bar'},
              },
            },
            'Bar': {
              'type': 'object',
              'properties': {
                'foo': {r'$ref': '#/components/schemas/Foo'},
              },
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('mutual');

      await renderToDirectory(spec: spec, outDir: out);

      expect(
        out,
        hasGeneratedSchemaFiles(['foo.dart', 'bar.dart']),
      );
      final foo = out.childFile('lib/models/foo.dart').readAsStringSync();
      final bar = out.childFile('lib/models/bar.dart').readAsStringSync();
      // Each file references the other's class and imports its model file.
      expect(foo, contains('final Bar? bar;'));
      expect(foo, contains("import 'package:mutual/models/bar.dart'"));
      expect(bar, contains('final Foo? foo;'));
      expect(bar, contains("import 'package:mutual/models/foo.dart'"));
    });

    test('fileRendererBuilder routes files through a subclass', () async {
      // A subclass overriding modelSubdir should see every schema's
      // file land in the directory it returns — and the default
      // `lib/models`/`lib/messages` layout should be bypassed.
      final spec = {
        'openapi': '3.1.0',
        'info': {'title': 'Custom Layout', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://example.com'},
        ],
        'paths': {
          '/widgets': {
            'post': {
              'operationId': 'createWidget',
              'requestBody': {
                'required': true,
                'content': {
                  'application/json': {
                    'schema': {
                      r'$ref': '#/components/schemas/CreateWidgetRequest',
                    },
                  },
                },
              },
              'responses': {
                '200': {
                  'description': 'OK',
                  'content': {
                    'application/json': {
                      'schema': {r'$ref': '#/components/schemas/Widget'},
                    },
                  },
                },
              },
            },
          },
        },
        'components': {
          'schemas': {
            'Widget': {
              'type': 'object',
              'properties': {
                'id': {'type': 'string'},
              },
            },
            'CreateWidgetRequest': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
              },
            },
          },
        },
      };
      final fs = MemoryFileSystem.test();
      final out = fs.directory('custom');
      final specFile = fs.file('spec.json')
        ..createSync(recursive: true)
        ..writeAsStringSync(jsonEncode(spec));
      await runWithLogger(
        _MockLogger(),
        () => loadAndRenderSpec(
          GeneratorConfig(
            specUrl: Uri.file(specFile.path),
            packageName: 'custom',
            outDir: out,
            templatesDir: templatesDir,
            runProcess: runProcess,
            logSchemas: false,
            fileRendererBuilder: _CustomLayoutRenderer.new,
          ),
        ),
      );
      expect(out.childFile('lib/custom/widget.dart'), exists);
      expect(out.childFile('lib/custom/create_widget_request.dart'), exists);
      expect(hasGeneratedSchemaDirs(out), isFalse);
    });
  });

  group('Formatter', () {
    test('format and fix error', () {
      io.ProcessResult runProcess(
        String executable,
        List<String> arguments, {
        String? workingDirectory,
      }) {
        return io.ProcessResult(0, 1, '', 'Error');
      }

      final logger = _MockLogger();
      final formatter = Formatter(runProcess: runProcess);
      expect(
        () => runWithLogger(
          logger,
          () => formatter.formatAndFix(pkgDir: '/tmp/spacetraders'),
        ),
        throwsA(isA<Exception>()),
      );
      verify(() => logger.info('Error')).called(1);
    });
  });

  group('FileWriter', () {
    test('writing twice throws', () {
      final fs = MemoryFileSystem.test();
      final out = fs.directory('spacetraders');

      final fileWriter = FileWriter(outDir: out)
        ..writeFile(path: 'foo.dart', content: 'foo');
      expect(
        () => fileWriter.writeFile(path: 'foo.dart', content: 'bar'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('suppressLongLineLintInGeneratedFiles', () {
    Directory setUpDir(Map<String, String> files) {
      final fs = MemoryFileSystem.test();
      final dir = fs.directory('/out')..createSync(recursive: true);
      for (final entry in files.entries) {
        dir.childFile(entry.key)
          ..parent.createSync(recursive: true)
          ..writeAsStringSync(entry.value);
      }
      return dir;
    }

    test('leaves short-only files untouched', () {
      final shortContent = List.generate(5, (i) => 'var x$i = $i;').join('\n');
      final dir = setUpDir({'lib/short.dart': shortContent});
      suppressLongLineLintInGeneratedFiles(dir);
      expect(
        dir.childFile('lib/short.dart').readAsStringSync(),
        shortContent,
      );
    });

    test('prepends directive to files with any line > 80 cols', () {
      final longLine = '// ${'a' * 100}';
      const shortContent = 'var x = 1;\n';
      final dir = setUpDir({
        'lib/long.dart': '$shortContent$longLine\n',
        'lib/also_short.dart': shortContent,
      });
      suppressLongLineLintInGeneratedFiles(dir);
      expect(
        dir.childFile('lib/long.dart').readAsStringSync(),
        startsWith('$longLineIgnoreBlock\n'),
      );
      expect(
        dir.childFile('lib/also_short.dart').readAsStringSync(),
        shortContent,
      );
    });

    test('is idempotent — does not stack the directive', () {
      final longLine = '// ${'a' * 100}';
      final dir = setUpDir({
        'lib/long.dart': '$longLineIgnoreBlock\n$longLine\n',
      });
      suppressLongLineLintInGeneratedFiles(dir);
      final content = dir.childFile('lib/long.dart').readAsStringSync();
      // Directive appears exactly once.
      expect(
        longLineIgnoreBlock.allMatches(content).length,
        1,
      );
    });

    test('ignores non-dart files', () {
      final longLine = 'x' * 100;
      final dir = setUpDir({'README.md': longLine});
      suppressLongLineLintInGeneratedFiles(dir);
      expect(dir.childFile('README.md').readAsStringSync(), longLine);
    });

    test('ignores a line exactly 80 chars (at the limit, not over)', () {
      final exactly80 = 'x' * 80;
      final dir = setUpDir({'lib/borderline.dart': '$exactly80\n'});
      suppressLongLineLintInGeneratedFiles(dir);
      expect(
        dir.childFile('lib/borderline.dart').readAsStringSync(),
        '$exactly80\n',
      );
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
  });

  // While we still support logging, this should no longer happen since
  // we detect collisions and fix them during resolution.
  test('logNameCollisions', () {
    final logger = _MockLogger();
    runWithLogger(
      logger,
      () => logNameCollisions([
        RenderUnknown(
          common: CommonProperties.test(
            snakeName: 'foo',
            pointer: JsonPointer.parse('#/foo'),
          ),
        ),
        RenderUnknown(
          common: CommonProperties.test(
            snakeName: 'foo',
            pointer: JsonPointer.parse('#/bar'),
            description: 'Bar description',
          ),
        ),
      ]),
    );
    verify(() => logger.warn('Schema foo has 2 name collisions')).called(1);
    verify(() => logger.info('#/foo')).called(1);
    verify(() => logger.info('#/bar')).called(1);
  });

  test('applyMandatoryReplacements', () {
    final replacements = {'FOO_BAR': 'FOO_BAZ'};
    const template = 'FOO_BAR';
    final output = applyMandatoryReplacements(template, replacements);
    expect(output, 'FOO_BAZ');
    expect(
      () => applyMandatoryReplacements(template, {'MISSING': 'OOPS'}),
      throwsA(isA<Exception>()),
    );
  });

  group('FileRenderer', () {
    test('imports for model', () {
      final templates = TemplateProvider.defaultLocation();
      final schemaRenderer = SchemaRenderer(templates: templates);
      final formatter = Formatter();
      final spellChecker = SpellChecker();
      final fileRenderer = FileRenderer(
        FileRendererConfig(
          packageName: 'spacetraders',
          schemaRenderer: schemaRenderer,
          templates: templates,
          formatter: formatter,
          fileWriter: FileWriter(
            outDir: MemoryFileSystem.test().directory('spacetraders'),
          ),
          spellChecker: spellChecker,
        ),
      );
      final schema = RenderObject(
        common: CommonProperties.test(
          snakeName: 'foo',
          pointer: JsonPointer.parse('#/foo'),
          description: 'Foo description',
        ),
        properties: {
          'bar': RenderBinary(
            common: CommonProperties.test(
              snakeName: 'bar',
              pointer: JsonPointer.parse('#/bar'),
              description: 'Bar description',
            ),
          ),
        },
      );
      final imports = fileRenderer.importsForModel(
        schema,
        const SchemaUsage(
          usesMetaAnnotations: true,
          modelHelpers: {ModelHelpers.parseFromJson},
        ),
      );
      expect(imports, {
        const Import('package:meta/meta.dart'),
        const Import('package:spacetraders/model_helpers.dart'),
        const Import('dart:typed_data'), // Uint8List from RenderBinary.
      });
    });

    test('imports for api', () {
      final templates = TemplateProvider.defaultLocation();
      final schemaRenderer = SchemaRenderer(templates: templates);
      final formatter = Formatter();
      final spellChecker = SpellChecker();
      final fileRenderer = FileRenderer(
        FileRendererConfig(
          packageName: 'spacetraders',
          schemaRenderer: schemaRenderer,
          templates: templates,
          formatter: formatter,
          fileWriter: FileWriter(
            outDir: MemoryFileSystem.test().directory('spacetraders'),
          ),
          spellChecker: spellChecker,
        ),
      );
      final api = Api(
        snakeName: 'foo',
        description: 'Foo description',
        removePrefix: null,
        endpoints: [
          Endpoint(
            operation: RenderOperation(
              path: '/bar',
              snakeName: 'bar',
              pointer: JsonPointer.parse('#/bar'),
              method: Method.get,
              tags: ['foo'],
              returnType: RenderVoid(
                common: CommonProperties.test(
                  snakeName: 'bar',
                  pointer: JsonPointer.parse('#/bar'),
                  description: 'Bar description',
                ),
              ),
              summary: 'Bar',
              description: 'Bar description',
              parameters: [
                RenderParameter(
                  name: 'foo',
                  description: 'Foo description',
                  type: RenderBinary(
                    common: CommonProperties.test(
                      snakeName: 'foo',
                      pointer: JsonPointer.parse('#/foo'),
                      description: 'Foo description',
                    ),
                  ),
                  isRequired: true,
                  isDeprecated: false,
                  inLocation: ParameterLocation.query,
                ),
              ],
              requestBody: null,
              responses: <RenderResponse>[],
              rangeResponses: <RenderRangeResponse>[],
              defaultResponse: null,
              securityRequirements: <ResolvedSecurityRequirement>[],
            ),
            serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
          ),
        ],
      );
      final imports = fileRenderer.importsForApi(api, const ApiUsage());
      expect(imports, {
        const Import('dart:async'),
        const Import('dart:convert'),
        const Import('dart:io'),
        const Import('package:spacetraders/api_client.dart'),
        const Import('package:spacetraders/api_exception.dart'),
        const Import('package:http/http.dart', asName: 'http'),
        const Import('dart:typed_data'), // Uint8List from RenderBinary.
      });
    });
  });
}
