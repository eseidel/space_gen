import 'dart:convert';
import 'dart:io';

import 'package:space_gen/space_gen.dart';
import 'package:test/test.dart';

void main() {
  final specJson = {
    'openapi': '3.1.0',
    'info': {
      'title': 'Component schemas public API test',
      'description': 'Ignored metadata should not require a scoped logger.',
      'version': '1.0.0',
      'license': {'name': 'MIT'},
    },
    'servers': [
      {'url': 'https://example.com'},
    ],
    'paths': <String, dynamic>{},
    'components': {
      'schemas': {
        'User': {
          'type': 'object',
          'properties': {
            'pet': {r'$ref': '#/components/schemas/Pet'},
            'escaped': {r'$ref': '#/components/schemas/Foo~1Bar'},
          },
        },
        'Pet': {'type': 'string'},
        'Foo/Bar': {'type': 'integer'},
        'PetAlias': {r'$ref': '#/components/schemas/Pet'},
        'Unreferenced': {
          'type': 'object',
          'properties': {
            'name': {'type': 'string'},
          },
        },
      },
    },
  };

  test('public API exposes parsed component schemas', () {
    final spec = parseOpenApi(specJson);

    final components = spec.components;
    expect(components.schemas.keys, [
      'User',
      'Pet',
      'Foo/Bar',
      'PetAlias',
      'Unreferenced',
    ]);

    final user = components.schemas['User']!.object! as SchemaObject;
    expect(
      user.properties['pet']!.ref!.uri.toString(),
      '#/components/schemas/Pet',
    );
    expect(
      user.properties['escaped']!.ref!.uri.toString(),
      '#/components/schemas/Foo~1Bar',
    );

    expect(components.schemas['Pet'], isA<SchemaRef>());
    expect(components.schemas['Foo/Bar'], isA<SchemaRef>());
    expect(
      components.schemas['PetAlias']!.ref!.uri.toString(),
      '#/components/schemas/Pet',
    );
  });

  test('loadRenderSpec builds a render tree without rendering files', () async {
    final tempDir = await Directory.systemTemp.createTemp('space_gen_test_');
    addTearDown(() => tempDir.delete(recursive: true));
    final specFile = File('${tempDir.path}/openapi.json')
      ..writeAsStringSync(jsonEncode(specJson));

    final spec = await loadRenderSpec(
      SpecParserConfig(specUrl: specFile.uri, logSchemas: false),
    );

    expect(spec, isA<RenderSpec>());
    expect(spec.title, 'Component schemas public API test');
    expect(spec.paths, isEmpty);
    expect(spec.componentSchemas.keys, [
      'User',
      'Pet',
      'Foo/Bar',
      'PetAlias',
      'Unreferenced',
    ]);
    expect(spec.componentSchemas['Unreferenced'], isA<RenderObject>());
    expect(
      collectAllSchemas(spec),
      contains(spec.componentSchemas['Unreferenced']),
    );
  });
}
