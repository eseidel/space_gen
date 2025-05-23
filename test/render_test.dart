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
        () => renderSpec(
          specUri: Uri.file(spec.path),
          packageName: 'spacetraders',
          outDir: out,
        ),
      ),
      throwsA(isA<FormatException>()),
    );
  });

  test('renderSpec smoke test', () async {
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
      () => renderSpec(
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

  test('renderSpec with real endpoints', () async {
    final fs = MemoryFileSystem.test();
    final spec = fs.file('test/spec.json')
      ..createSync(recursive: true)
      ..writeAsStringSync(
        jsonEncode({
          'servers': [
            {'url': 'https://api.spacetraders.io/v2'},
          ],
          'paths': {
            '/my/account': {
              'get': {
                'operationId': 'get-my-account',
                'summary': 'Get Account',
                'description': 'Fetch your account details.',
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
                    'type': 'object',
                    'enumValues': ['admin', 'user'],
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
      () => renderSpec(
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
      out.childFile('lib/model/get_my_account200_response.dart').existsSync(),
      isTrue,
    );
    expect(out.childFile('lib/model/account.dart').existsSync(), isTrue);
    expect(out.childFile('lib/model/account_role.dart').existsSync(), isTrue);
  });
}
