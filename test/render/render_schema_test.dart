// We don't have a good way to shorten the literal strings from the
// expected generated code, so ignoring 80c for now.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:space_gen/src/logger.dart';
import 'package:space_gen/src/render.dart';
import 'package:test/test.dart';

class _MockLogger extends Mock implements Logger {}

void main() {
  group('renderSchema', () {
    test('smoke test', () {
      final schema = {
        'type': 'object',
        'properties': {'foo': <String, dynamic>{}},
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.foo, \n'
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            foo: json['foo'],\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final dynamic? foo;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'foo': foo,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          foo.hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && this.foo == other.foo\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });
    test('property with `type: null` renders as dynamic', () {
      // JSON Schema 2020-12 / OpenAPI 3.1 allows `{"type": "null"}` —
      // a field whose only legal value is null. The parser produces a
      // ResolvedNull for this; previously toRenderSchema had no case
      // for it and aborted with
      // `UnimplementedError: Unknown schema: ResolvedNull`.
      final schema = {
        'type': 'object',
        'required': ['id'],
        'properties': {
          'id': {'type': 'string'},
          'placeholder': {'type': 'null'},
        },
      };
      final result = renderTestSchema(schema);
      // Field emitted as `dynamic`, passthrough in toJson/fromJson.
      expect(result, contains('final dynamic? placeholder;'));
      expect(result, contains("placeholder: json['placeholder'],"));
      expect(result, contains("'placeholder': placeholder,"));
    });

    test('property description emits dartdoc on the field', () {
      final schema = {
        'type': 'object',
        'required': ['id'],
        'properties': {
          'id': {
            'type': 'string',
            'description': 'The ID of the thing.',
          },
        },
      };
      final result = renderTestSchema(schema);
      // The property's description should appear as dartdoc immediately
      // before the field declaration.
      expect(
        result,
        contains('/// The ID of the thing.\n    final String id;'),
      );
    });

    test('long property description wraps to 80 cols at 4-space indent', () {
      final schema = {
        'type': 'object',
        'required': ['id'],
        'properties': {
          'id': {
            'type': 'string',
            'description':
                'A quite long property description that must be wrapped '
                'across multiple lines so that it does not exceed the '
                'eighty-column limit applied to the generated code.',
          },
        },
      };
      final result = renderTestSchema(schema);
      for (final line in const LineSplitter().convert(result)) {
        if (line.trimLeft().startsWith('///')) {
          expect(line.length, lessThanOrEqualTo(80), reason: 'line: "$line"');
          // Field-level dartdoc should be indented with 4 spaces.
          expect(line, startsWith('    /// '), reason: 'line: "$line"');
        }
      }
    });

    test('propertyNames with ref to a string enum gives a typed map key', () {
      final schemas = <String, Map<String, dynamic>>{
        'Platform': {
          'type': 'string',
          'enum': ['android', 'ios'],
        },
        'Status': {
          'type': 'string',
          'enum': ['draft', 'active'],
        },
        'R': {
          'type': 'object',
          'required': ['statuses'],
          'properties': {
            'statuses': {
              'type': 'object',
              'additionalProperties': {
                r'$ref': '#/components/schemas/Status',
              },
              'propertyNames': {
                r'$ref': '#/components/schemas/Platform',
              },
            },
          },
        },
      };
      final rendered = renderTestSchemas(
        schemas,
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final r = rendered['R']!;
      expect(r, contains('final Map<Platform, Status> statuses;'));
      expect(r, contains('MapEntry(Platform.fromJson(key), Status.fromJson'));
      expect(r, contains('MapEntry(key.toJson(), value.toJson())'));
    });

    test('propertyNames without an enum ref is a spec error', () {
      final schema = {
        'type': 'object',
        'required': ['statuses'],
        'properties': {
          'statuses': {
            'type': 'object',
            'additionalProperties': {'type': 'string'},
            'propertyNames': {'type': 'string'},
          },
        },
      };
      expect(
        () => renderTestSchema(schema, asComponent: true),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('must resolve to a string enum'),
          ),
        ),
      );
    });

    test(
      'contentEncoding=base64 property renders as Uint8List with '
      'base64 codec',
      () {
        // Discord's `avatar`/`image` upload fields. The wire is a JSON
        // string; the Dart-side type is `Uint8List` with auto-encode in
        // `toJson` and auto-decode in `fromJson`. The required path
        // calls `base64.decode` / `base64.encode` directly; the nullable
        // path goes through `maybeBase64Decode` / `maybeBase64Encode`
        // helpers (so a public-property `Uint8List?` doesn't need to
        // promote inside a ternary).
        final schema = {
          'type': 'object',
          'required': ['image'],
          'properties': {
            'image': {'type': 'string', 'contentEncoding': 'base64'},
            'avatar': {'type': 'string', 'contentEncoding': 'base64'},
          },
        };
        final result = renderTestSchema(schema);
        expect(result, contains('final Uint8List image;'));
        expect(result, contains('final Uint8List? avatar;'));
        // Required: direct calls.
        expect(
          result,
          contains("image: base64.decode(json['image'] as String)"),
        );
        expect(result, contains("'image': base64.encode(image)"));
        // Nullable: via the model_helpers wrappers.
        expect(
          result,
          contains("avatar: maybeBase64Decode(json['avatar'] as String?)"),
        );
        expect(result, contains("'avatar': maybeBase64Encode(avatar)"));
      },
    );

    test('x-enum-descriptions emits dartdoc per enum case', () {
      final schema = {
        'type': 'string',
        'enum': ['owner', 'admin', 'viewer'],
        'x-enum-descriptions': [
          'User that created the organization.',
          'Users who have permissions to manage the organization.',
          'Users with read-only access.',
        ],
      };
      final result = renderTestSchema(schema, asComponent: true);
      expect(
        result,
        contains(
          '    /// User that created the organization.\n'
          "    owner._('owner'),\n",
        ),
      );
      expect(
        result,
        contains(
          '    /// Users who have permissions to manage the organization.\n'
          "    admin._('admin'),\n",
        ),
      );
      expect(
        result,
        contains(
          '    /// Users with read-only access.\n'
          "    viewer._('viewer'),\n",
        ),
      );
    });

    test('x-enum-descriptions length mismatch is a spec error', () {
      final schema = {
        'type': 'string',
        'enum': ['a', 'b'],
        'x-enum-descriptions': ['only one'],
      };
      expect(
        () => renderTestSchema(schema, asComponent: true),
        throwsA(isA<FormatException>()),
      );
    });

    test('x-enum-descriptions with non-string entries is a spec error', () {
      final schema = {
        'type': 'string',
        'enum': ['a', 'b'],
        // Length matches, but the second entry is not a string.
        'x-enum-descriptions': ['ok', 42],
      };
      expect(
        () => renderTestSchema(schema, asComponent: true),
        throwsA(
          isA<FormatException>().having(
            (e) => e.message,
            'message',
            contains('must be a list of strings'),
          ),
        ),
      );
    });

    test('trailing newline in description does not produce blank ///', () {
      // Spec yaml block scalars (`description: |`) add a trailing '\n'
      // to the string; make sure that does not render as a dangling
      // `///` line before the field declaration.
      final schema = {
        'type': 'object',
        'required': ['id'],
        'properties': {
          'id': {
            'type': 'string',
            'description': 'Trailing newline.\n',
          },
        },
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        contains('/// Trailing newline.\n    final String id;'),
      );
      expect(result, isNot(contains('///\n    final String id;')));
    });

    test('multi-line property description preserves paragraph breaks', () {
      final schema = {
        'type': 'object',
        'required': ['id'],
        'properties': {
          'id': {
            'type': 'string',
            'description': 'First line.\nSecond line.',
          },
        },
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        contains(
          '    /// First line.\n'
          '    /// Second line.\n'
          '    final String id;',
        ),
      );
    });

    test('datetime', () {
      final schema = {
        'type': 'object',
        'properties': {
          'foo': {
            'type': 'string',
            'format': 'date-time',
            'default': '2012-04-23T18:25:43.511Z',
          },
        },
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { DateTime? foo, \n'
        '         }\n'
        "    ): this.foo = foo ?? DateTime.parse('2012-04-23T18:25:43.511Z');\n"
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            foo: maybeParseDateTime(json['foo'] as String?),\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final DateTime? foo;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'foo': foo?.toIso8601String(),\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          foo.hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && this.foo == other.foo\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    group('uri', () {
      test('nullable', () {
        final schema = {
          'type': 'object',
          'properties': {
            'foo': {
              'type': 'string',
              'format': 'uri',
              'default': 'https://example.com',
            },
          },
        };
        final result = renderTestSchema(schema);
        expect(
          result,
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { Uri? foo, \n'
          '         }\n'
          "    ): this.foo = foo ?? Uri.parse('https://example.com');\n"
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            foo: maybeParseUri(json['foo'] as String?),\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final Uri? foo;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'foo': foo?.toString(),\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          foo.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.foo == other.foo\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });

      test('non-nullable', () {
        final schema = {
          'type': 'object',
          'properties': {
            'foo': {'type': 'string', 'format': 'uri'},
          },
          'required': ['foo'],
        };
        final result = renderTestSchema(schema);
        expect(
          result,
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { required this.foo, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            foo: Uri.parse(json['foo'] as String),\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final Uri foo;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'foo': foo.toString(),\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          foo.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.foo == other.foo\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });

    group('uriTemplate', () {
      test('nullable', () {
        final schema = {
          'type': 'object',
          'properties': {
            'foo': {
              'type': 'string',
              'format': 'uri-template',
              'default': 'https://example.com/{foo}',
            },
          },
        };
        final result = renderTestSchema(schema);
        expect(
          result,
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { UriTemplate? foo, \n'
          '         }\n'
          "    ): this.foo = foo ?? UriTemplate('https://example.com/{foo}');\n"
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            foo: maybeParseUriTemplate(json['foo'] as String?),\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final UriTemplate? foo;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'foo': foo?.toString(),\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          foo.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.foo == other.foo\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });

      test('non-nullable', () {
        final schema = {
          'type': 'object',
          'properties': {
            'foo': {'type': 'string', 'format': 'uri-template'},
          },
          'required': ['foo'],
        };
        final result = renderTestSchema(schema);
        expect(
          result,
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { required this.foo, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            foo: UriTemplate(json['foo'] as String),\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final UriTemplate foo;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'foo': foo.toString(),\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          foo.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.foo == other.foo\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });

    test('allOf', () {
      final schema = {
        'allOf': [
          {
            'type': 'object',
            'properties': {
              'foo': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'properties': {
              'bar': {'type': 'number'},
            },
          },
        ],
      };
      final logger = _MockLogger();
      final result = runWithLogger(logger, () => renderTestSchema(schema));
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.foo, this.bar, \n'
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            foo: json['foo'] as String?,\n"
        "            bar: (json['bar'] as num?)?.toDouble(),\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final String? foo;\n'
        'final double? bar;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'foo': foo,\n"
        "            'bar': bar,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '        Object.hashAll([\n'
        '          foo,\n'
        '          bar,\n'
        '        ]);\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && this.foo == other.foo\n'
        '            && this.bar == other.bar\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    test('allOf merges required across members', () {
      // Both members require their own property; the synthesized
      // RenderObject must mark both required, otherwise downstream
      // generation drops the `required` modifier and silently makes
      // them nullable.
      final schema = {
        'allOf': [
          {
            'type': 'object',
            'required': ['foo'],
            'properties': {
              'foo': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'required': ['bar'],
            'properties': {
              'bar': {'type': 'integer'},
            },
          },
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains('required this.foo'));
      expect(result, contains('required this.bar'));
      expect(result, contains('final String foo;'));
      expect(result, contains('final int bar;'));
    });

    test('oneOf of allOf variants tagged by single-value enum', () {
      // Each variant is `allOf: [<rule>, <info>]` where the first
      // member tags itself with a single-value enum on `type`. After
      // the allOf merge propagates `requiredProperties`, the implicit
      // discriminator detection should engage and produce a switch
      // on `json['type']` instead of the legacy stub.
      final schema = {
        'oneOf': [
          {
            'allOf': [
              {
                'type': 'object',
                'required': ['type'],
                'properties': {
                  'type': {
                    'type': 'string',
                    'enum': ['creation'],
                  },
                },
              },
              {
                'type': 'object',
                'properties': {
                  'extra': {'type': 'string'},
                },
              },
            ],
          },
          {
            'allOf': [
              {
                'type': 'object',
                'required': ['type'],
                'properties': {
                  'type': {
                    'type': 'string',
                    'enum': ['deletion'],
                  },
                },
              },
              {
                'type': 'object',
                'properties': {
                  'extra': {'type': 'string'},
                },
              },
            ],
          },
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains("final discriminator = json['type']"));
      expect(result, contains('switch (discriminator)'));
      expect(result, contains("'creation' =>"));
      expect(result, contains("'deletion' =>"));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test(
      'oneOf with sibling properties + explicit discriminator '
      'without mapping synthesizes the dispatch from variant enums',
      () {
        // github `repos/{owner}/{repo}/check-runs` POST shape: parent
        // declares the full property set, oneOf variants only refine
        // `status`'s enum and conditionally require `conclusion`. The
        // spec's `discriminator: {propertyName: status}` has no
        // `mapping` — we synthesize one by walking each variant's
        // `status` enum.
        final schema = {
          'type': 'object',
          'required': ['name', 'head_sha'],
          'properties': {
            'name': {'type': 'string'},
            'head_sha': {'type': 'string'},
            'status': {
              'type': 'string',
              'enum': ['queued', 'in_progress', 'completed'],
            },
            'conclusion': {
              'type': 'string',
              'enum': ['success', 'failure'],
            },
          },
          'discriminator': {'propertyName': 'status'},
          'oneOf': [
            {
              'properties': {
                'status': {
                  'enum': ['completed'],
                },
              },
              'required': ['status', 'conclusion'],
              'additionalProperties': true,
            },
            {
              'properties': {
                'status': {
                  'enum': ['queued', 'in_progress'],
                },
              },
              'additionalProperties': true,
            },
          ],
        };
        final result = renderTestSchema(schema);
        // Discriminator dispatch on `status`.
        expect(result, contains("final discriminator = json['status']"));
        expect(result, contains("'completed' =>"));
        // Multi-value enum on the second variant produces multiple
        // case arms, all routing to the same variant.
        expect(result, contains("'queued' =>"));
        expect(result, contains("'in_progress' =>"));
        // No stub.
        expect(result, isNot(contains('throw UnimplementedError')));
      },
    );

    test(
      'anyOf with sibling properties dispatches via the loose '
      'required-field picker (no stub)',
      () {
        // github `repos/{owner}/{repo}/check-runs/{check_run_id}`
        // PATCH: anyOf, no discriminator. After parse-time merge of
        // parent properties, both variants share most properties;
        // only variant 0 *requires* `conclusion`. Loose required-
        // field uniqueness (anyOf-only) lets that be the dispatch
        // tag.
        final schema = {
          'type': 'object',
          'properties': {
            'name': {'type': 'string'},
            'status': {
              'type': 'string',
              'enum': ['queued', 'completed'],
            },
            'conclusion': {
              'type': 'string',
              'enum': ['success', 'failure'],
            },
          },
          'anyOf': [
            {
              'properties': {
                'status': {
                  'enum': ['completed'],
                },
              },
              'required': ['conclusion'],
              'additionalProperties': true,
            },
            {
              'properties': {
                'status': {
                  'enum': ['queued'],
                },
              },
              'additionalProperties': true,
            },
          ],
        };
        final result = renderTestSchema(schema);
        // No stub: the loose-mode required-field picker fires for
        // anyOf and dispatches via `containsKey('conclusion')`.
        expect(result, isNot(contains('throw UnimplementedError')));
        expect(result, contains("json.containsKey('conclusion')"));
      },
    );

    test('oneOf with [string, number] uses shape dispatch', () {
      // RenderNumber's shape key is `num` (matching jsonStorageType),
      // distinct from RenderString's `String`. Github's
      // webhook-config-insecure-ssl is the canonical real-spec site.
      final schema = {
        'oneOf': [
          {'type': 'string'},
          {'type': 'number'},
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains('factory Test.fromJson(dynamic json)'));
      expect(result, contains('String v => TestString(v)'));
      expect(result, contains('num v => TestNum(v)'));
      expect(result, contains('final class TestString extends Test'));
      expect(result, contains('final class TestNum extends Test'));
      expect(result, contains('final num value;'));
      // Wrapper toJson returns the raw num — no `.toJson()` call,
      // since num is already JSON-native.
      expect(result, contains('dynamic toJson() => value;'));
      expect(result, contains('@immutable'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('oneOf with [number, object] uses shape dispatch (num vs Map)', () {
      // Verifies RenderNumber's shape key composes with RenderObject's
      // `Map<String, dynamic>` — distinct shapes, so dispatch works.
      final schema = {
        'oneOf': [
          {'type': 'number'},
          {
            'type': 'object',
            'properties': {
              'foo': {'type': 'string'},
            },
          },
        ],
      };
      final result = renderTestSchema(schema);
      // Number variant keeps its primitive wrapper.
      expect(result, contains('num v => TestNum(v)'));
      // The inline-object variant smooshes — case arm constructs the
      // variant directly, no wrapper-class call. Variant data class
      // is inlined into the parent's file as a sealed subclass.
      expect(
        result,
        contains('Map<String, dynamic> v => TestOneOf1.fromJson(v)'),
      );
      expect(result, contains('final class TestOneOf1 extends Test'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('oneOf with [number, array] uses shape dispatch (num vs List)', () {
      // num and List<dynamic> are distinct runtime shapes.
      final schema = {
        'oneOf': [
          {'type': 'number'},
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains('num v => TestNum(v)'));
      expect(result, contains('List<dynamic> v => TestList'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('oneOf with [string, boolean] uses shape dispatch', () {
      // Pins the `RenderPod(type: PodType.boolean) => 'bool'` arm of
      // `_planVariant` — the only path that exercises it from a unit
      // test. (Github's Metadata1 anyOf hits it end-to-end via a full
      // generator run, but that is not unit-test coverage.)
      final schema = {
        'oneOf': [
          {'type': 'string'},
          {'type': 'boolean'},
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains('String v => TestString(v)'));
      expect(result, contains('bool v => TestBool(v)'));
      expect(result, contains('final bool value;'));
      expect(result, contains('final class TestBool extends Test'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('oneOf with [map, string] uses shape dispatch', () {
      // `type: object, additionalProperties: true` resolves to a
      // RenderMap (any-key string-to-dynamic map), not a RenderObject
      // newtype. Github's `deployment.payload` is the canonical site
      // — `oneOf: [<map>, string]`.
      final schema = {
        'oneOf': [
          {'type': 'object', 'additionalProperties': true},
          {'type': 'string'},
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains('Map<String, dynamic> v => TestMap(v)'));
      expect(result, contains('String v => TestString(v)'));
      expect(result, contains('final Map<String, dynamic> value;'));
      // No per-entry conversion when the value type is dynamic.
      expect(result, contains('dynamic toJson() => value;'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('typed map variant walks each entry through fromJson/toJson', () {
      // Map with a non-trivial value schema. The wrapper must convert
      // each entry on fromJson and reverse on toJson.
      final results = renderTestSchemas(
        {
          'Wrapper': {
            'oneOf': [
              {
                'type': 'object',
                'additionalProperties': {r'$ref': '#/components/schemas/Tag'},
              },
              {'type': 'string'},
            ],
          },
          'Tag': {
            'type': 'string',
            'minLength': 1,
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final wrapper = results['Wrapper'];
      expect(wrapper, isNotNull);
      expect(wrapper, contains('Map<String, dynamic> v => WrapperMap'));
      // Each entry's value is parsed through Tag.fromJson.
      expect(wrapper, contains('Tag.fromJson(val'));
      expect(wrapper, contains('MapEntry'));
    });

    test('two map variants do not shape-dispatch (key collision)', () {
      // Both map variants share `Map<String, dynamic>` as their shape
      // key — `_canShapeDispatch`'s key-uniqueness gate must reject
      // the dispatch and fall back to the legacy stub. Without the
      // gate, the second map wrapper would shadow the first at
      // runtime.
      final schema = {
        'oneOf': [
          {'type': 'object', 'additionalProperties': true},
          {
            'type': 'object',
            'additionalProperties': {'type': 'string'},
          },
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains('throw UnimplementedError'));
    });

    test('oneOf with [empty-object, string] uses shape dispatch', () {
      // RenderEmptyObject (an inline `type: object` with no
      // properties, or a `$ref` to one) needs `wrapperTag` and
      // `jsonShapeKey` to participate in shape dispatch. Pinning that
      // here covers the per-schema overrides plus the
      // `_variantConversion` arm that delegates to the EmptyObject
      // newtype's own `fromJson`/`toJson`.
      final schema = {
        'oneOf': [
          {'type': 'object', 'properties': <String, dynamic>{}},
          {'type': 'string'},
        ],
      };
      final result = renderTestSchema(schema);
      // Empty-object wrapper delegates to the named class.
      expect(result, contains('Map<String, dynamic> v =>'));
      expect(result, contains('.fromJson(v)'));
      expect(result, contains('value.toJson()'));
      expect(result, contains('String v => TestString(v)'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('number newtype does not participate in shape dispatch', () {
      // A `number` schema with validations becomes a newtype (its own
      // class), and `wrapperTag` / `jsonShapeKey` deliberately gate on
      // `!createsNewType`. So a oneOf whose variant is a *named* number
      // newtype can't shape-dispatch — the wrapper would shadow the
      // newtype's own class. This test pins that gate; without it, the
      // newtype case would silently hit the inline-pod arm of
      // `_planVariant` and emit a wrong dispatch.
      final results = renderTestSchemas(
        {
          'Wrapper': {
            'oneOf': [
              {'type': 'string'},
              {r'$ref': '#/components/schemas/Score'},
            ],
          },
          'Score': {
            'type': 'number',
            'minimum': 0,
            'maximum': 1,
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final wrapper = results['Wrapper'];
      expect(wrapper, isNotNull);
      // Newtype-Number cannot drive shape dispatch today (and the
      // inline String variant alone isn't enough to dispatch a
      // 2-variant oneOf), so this falls through to the legacy stub.
      // The contract here is: whatever fallback fires, it must NOT
      // emit a `num v =>` arm pointing at the newtype, since that
      // would conflict with Score's own factory.
      expect(wrapper, isNot(contains('num v => WrapperScore')));
    });

    test('oneOf with two objects sharing no props uses optional-tag '
        'dispatch', () {
      // Each variant has a unique optional property. Property-presence
      // dispatch keys on those (best-effort: the JSON might omit the
      // tag, in which case the throw at the end fires).
      final schema = {
        'oneOf': [
          {
            'type': 'object',
            'properties': {
              'foo': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'properties': {
              'bar': {'type': 'number'},
            },
          },
        ],
      };
      final result = renderTestSchema(schema);
      expect(result, contains("if (json.containsKey('foo'))"));
      expect(result, contains("if (json.containsKey('bar'))"));
      expect(result, contains('throw FormatException'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('oneOf with discriminator + mapping renders sealed dispatch '
        'with exclusive-use top-level variants smooshed', () {
      final results = renderTestSchemas(
        {
          'Pet': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Cat'},
              {r'$ref': '#/components/schemas/Dog'},
            ],
            'discriminator': {
              'propertyName': 'pet_type',
              'mapping': {
                'cat': '#/components/schemas/Cat',
                'dog': '#/components/schemas/Dog',
              },
            },
          },
          'Cat': {
            'type': 'object',
            'properties': {
              'pet_type': {'type': 'string'},
            },
            'required': ['pet_type'],
          },
          'Dog': {
            'type': 'object',
            'properties': {
              'pet_type': {'type': 'string'},
            },
            'required': ['pet_type'],
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final pet = results['Pet'];
      expect(pet, isNotNull);
      // Spot-check the dispatch shape rather than snapshot-matching the
      // full template — keeps the test resilient to whitespace tweaks.
      expect(pet, contains('sealed class Pet'));
      expect(pet, contains('factory Pet.fromJson(Map<String, dynamic> json)'));
      expect(pet, contains("final discriminator = json['pet_type']"));
      // `Cat` and `Dog` are top-level component schemas referenced
      // only as variants of `Pet` (no other property / param /
      // response slot uses them). They're exclusive-by-use, so they
      // smoosh: the case arms construct each variant directly (no
      // `PetCat` / `PetDog` wrapper) and the variant data classes
      // themselves are rendered inline in `pet.dart` as direct
      // sealed subclasses.
      expect(pet, contains("'cat' => Cat.fromJson(json)"));
      expect(pet, contains("'dog' => Dog.fromJson(json)"));
      expect(pet, contains(r"Unknown pet_type '$discriminator' for Pet"));
      // Variant data classes inlined as direct sealed subclasses.
      expect(pet, contains('final class Cat extends Pet'));
      expect(pet, contains('final class Dog extends Pet'));
      expect(pet, contains('@override'));
      // No wrapper subclasses (`PetCat`/`PetDog`) survive.
      expect(pet, isNot(contains('class PetCat ')));
      expect(pet, isNot(contains('class PetDog ')));
      expect(pet, isNot(contains('final Cat value;')));
      expect(pet, isNot(contains('final Dog value;')));
    });

    test(
      'oneOf with discriminator but a non-object variant falls through '
      'to shape dispatch (discriminator is ignored — un-honorable on '
      'the non-object branch)',
      () {
        final results = renderTestSchemas(
          {
            'Mixed': {
              'oneOf': [
                {r'$ref': '#/components/schemas/Cat'},
                {'type': 'string'},
              ],
              'discriminator': {
                'propertyName': 'pet_type',
                'mapping': {
                  'cat': '#/components/schemas/Cat',
                },
              },
            },
            'Cat': {
              'type': 'object',
              'properties': {
                'pet_type': {'type': 'string'},
              },
              'required': ['pet_type'],
            },
          },
          specUrl: Uri.parse('file:///spec.yaml'),
        );
        final mixed = results['Mixed'];
        expect(mixed, isNotNull);
        // Distinct shapes (Map vs String) → shape dispatch. `Cat` is
        // exclusive-by-use (only referenced as a variant of `Mixed`),
        // so it smooshes — the Map arm constructs `Cat` directly, no
        // `MixedCat` wrapper. The non-object string variant keeps its
        // `MixedString` wrapper (primitives can't extend a sealed
        // class).
        expect(mixed, contains('factory Mixed.fromJson(dynamic json)'));
        expect(mixed, contains('Map<String, dynamic> v => Cat.fromJson(v)'));
        expect(mixed, contains('String v => MixedString'));
        expect(mixed, contains('final class Cat extends Mixed'));
        expect(mixed, isNot(contains('class MixedCat ')));
        expect(mixed, isNot(contains('UnimplementedError')));
      },
    );

    test('non-discriminator oneOf with distinct shapes uses shape '
        'dispatch', () {
      final result = renderTestSchema({
        'oneOf': [
          {'type': 'integer'},
          {'type': 'string'},
        ],
      });
      // Pattern-matched switch on the runtime json type.
      expect(result, contains('factory Test.fromJson(dynamic json)'));
      expect(result, contains('int v => TestInt(v)'));
      expect(result, contains('String v => TestString(v)'));
      // Wrappers store the primitive value directly, toJson is just the
      // value.
      expect(result, contains('final int value;'));
      expect(result, contains('dynamic toJson() => value;'));
      expect(result, contains('final class TestInt extends Test'));
      expect(result, contains('final class TestString extends Test'));
      expect(result, contains('@immutable'));
    });

    test('non-discriminator oneOf with an array variant uses shape '
        'dispatch', () {
      // Common github pattern: a request body that's either a string
      // or a list-of-strings. List<dynamic> vs String are distinct
      // shapes, so dispatch works.
      final result = renderTestSchema({
        'oneOf': [
          {'type': 'string'},
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
        ],
      });
      expect(result, contains('factory Test.fromJson(dynamic json)'));
      expect(result, contains('String v => TestString(v)'));
      expect(result, contains('List<dynamic> v => TestList'));
      // For primitive-item arrays we cast rather than map.
      expect(result, contains('TestList(v.cast<String>())'));
      // toJson on the list wrapper just returns value (List<String>
      // is already JSON-compatible).
      expect(result, contains('final List<String> value;'));
      expect(result, contains('final class TestList extends Test'));
    });

    test('non-discriminator oneOf with array of objects maps each item '
        "through the item type's fromJson", () {
      final results = renderTestSchemas(
        {
          'Wrapper': {
            'oneOf': [
              {'type': 'string'},
              {
                'type': 'array',
                'items': {r'$ref': '#/components/schemas/Inner'},
              },
            ],
          },
          'Inner': {
            'type': 'object',
            'properties': {
              'name': {'type': 'string'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final wrapper = results['Wrapper'];
      expect(wrapper, isNotNull);
      expect(wrapper, contains('List<dynamic> v => WrapperList'));
      // Object items go through their own fromJson factory.
      expect(wrapper, contains('v.map<Inner>((e) => Inner.fromJson('));
      expect(wrapper, contains('final List<Inner> value;'));
      // Object items also need toJson on each element.
      expect(wrapper, contains('value.map((e) => e.toJson()).toList()'));
    });

    test('non-discriminator oneOf with two array variants falls back '
        '(both share List<dynamic>)', () {
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
          {
            'type': 'array',
            'items': {'type': 'integer'},
          },
        ],
      });
      // Two arrays of *primitive* items both share List<dynamic> AND
      // have no element-level required fields to peek at — dispatch
      // can't distinguish, fall through to the legacy stub.
      expect(result, contains("throw UnimplementedError('Test.fromJson')"));
    });

    test('non-discriminator anyOf with two array<object> variants where '
        'the element types have a unique required tag uses array-element '
        'dispatch', () {
      // Real-world site: github's `activity/list-stargazers-for-repo`
      // has `anyOf<array<simple-user>, array<stargazer>>`. Stargazer
      // requires `starred_at` (which simple-user doesn't list at all),
      // so we can peek `(json as List).first.containsKey('starred_at')`
      // and pick the right wrapper.
      final results = renderTestSchemas(
        {
          'StarsResp': {
            'anyOf': [
              {
                'type': 'array',
                'items': {r'$ref': '#/components/schemas/Stargazer'},
              },
              {
                'type': 'array',
                'items': {r'$ref': '#/components/schemas/User'},
              },
            ],
          },
          'Stargazer': {
            'type': 'object',
            'required': ['starred_at', 'user'],
            'properties': {
              'starred_at': {'type': 'string'},
              'user': {'type': 'object'},
            },
          },
          'User': {
            'type': 'object',
            'required': ['login'],
            'properties': {
              'login': {'type': 'string'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final result = results['StarsResp'];
      expect(result, isNotNull);
      // Factory takes a dynamic since we cast to List inside.
      expect(result, contains('factory StarsResp.fromJson(dynamic json)'));
      // Cast once to a list local; predicates and wrappers reuse it.
      expect(result, contains('final v = json as List;'));
      // Element-peek dispatch: stargazer's tag is `starred_at`.
      expect(
        result,
        contains(
          'v.isNotEmpty && '
          "(v.first as Map<String, dynamic>).containsKey('starred_at')",
        ),
      );
      // Wrapper subclass names splice in the items type so the two
      // `array<>` variants produce distinct classes.
      expect(result, contains('class StarsRespStargazerList'));
      expect(result, contains('class StarsRespUserList'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('array-element dispatch puts the variant whose items have no '
        'unique fields at the end as a fallback (no `if` guard)', () {
      // Plain `Item` is a subset of `Tagged` — Tagged adds a unique
      // `kind` property. The picker promotes `Item` to fallback so
      // an empty list (or one whose first element lacks `kind`) flows
      // there without throwing.
      final results = renderTestSchemas(
        {
          'Resp': {
            'oneOf': [
              {
                'type': 'array',
                'items': {r'$ref': '#/components/schemas/Item'},
              },
              {
                'type': 'array',
                'items': {r'$ref': '#/components/schemas/Tagged'},
              },
            ],
          },
          'Item': {
            'type': 'object',
            'properties': {
              'name': {'type': 'string'},
            },
          },
          'Tagged': {
            'type': 'object',
            'required': ['kind'],
            'properties': {
              'kind': {'type': 'string'},
              'name': {'type': 'string'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final result = results['Resp'];
      expect(result, isNotNull);
      // Tagged is dispatched on `kind`; Item is the unguarded fallback.
      expect(
        result,
        contains(
          'v.isNotEmpty && '
          "(v.first as Map<String, dynamic>).containsKey('kind')",
        ),
      );
      // Fallback variant has no `if` guard — it's the unconditional
      // return after the checked arm.
      expect(result, contains('return RespItemList('));
      expect(result, isNot(contains('throw UnimplementedError')));
      // Empty-list fallthrough: no `containsKey` for `name` (the only
      // property of Item), since Item is the fallback variant.
      expect(
        result,
        isNot(
          contains("(v.first as Map<String, dynamic>).containsKey('name')"),
        ),
      );
    });

    test('array-element dispatch bails when items are primitives '
        '(no required-fields to peek)', () {
      // Same primitive-arrays case as the legacy fallback test,
      // confirming the new array-element picker doesn't claim it.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
          {
            'type': 'array',
            'items': {'type': 'integer'},
          },
        ],
      });
      expect(result, contains("throw UnimplementedError('Test.fromJson')"));
    });

    test('property-array-item-shape dispatch separates twins whose '
        'top-level keys are identical but whose shared array property '
        'items have distinct JSON shape (object vs string)', () {
      // Real-world site: github's `oneOf<validation-error,
      // validation-error-simple>` (the orgs/update 422 and projects/
      // create-card 422 responses). Both have the same required keys
      // [message, documentation_url] and the same optional `errors`
      // array; the only structural difference is the shape of items
      // inside `errors` — object for `Detailed`, string for `Simple`.
      final results = renderTestSchemas(
        {
          'Resp': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Detailed'},
              {r'$ref': '#/components/schemas/Simple'},
            ],
          },
          'Detailed': {
            'type': 'object',
            'required': ['message', 'documentation_url'],
            'properties': {
              'message': {'type': 'string'},
              'documentation_url': {'type': 'string'},
              'errors': {
                'type': 'array',
                'items': {
                  'type': 'object',
                  'required': ['code'],
                  'properties': {
                    'code': {'type': 'string'},
                  },
                },
              },
            },
          },
          'Simple': {
            'type': 'object',
            'required': ['message', 'documentation_url'],
            'properties': {
              'message': {'type': 'string'},
              'documentation_url': {'type': 'string'},
              'errors': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final result = results['Resp'];
      expect(result, isNotNull);
      // Object-shaped variants → factory takes Map (no `dynamic` cast
      // preamble like the array-element kind).
      expect(
        result,
        contains('factory Resp.fromJson(Map<String, dynamic> json)'),
      );
      expect(result, isNot(contains('final v = json as List;')));
      // Detailed arm: errors[].items is object → first is Map.
      expect(
        result,
        contains(
          "if (json['errors'] is List && "
          "(json['errors'] as List).isNotEmpty && "
          "(json['errors'] as List).first is Map<String, dynamic>)",
        ),
      );
      // Simple arm: last variant → unguarded `Always` fallback. No
      // `if (... first is String)` guard: when the discriminator
      // property is absent or empty (spec-legal — github lists
      // `errors` as optional on both variants), the response routes
      // to the simpler form rather than throwing.
      expect(
        result,
        isNot(
          contains(
            "if (json['errors'] is List && "
            "(json['errors'] as List).isNotEmpty && "
            "(json['errors'] as List).first is String)",
          ),
        ),
      );
      // `Detailed` and `Simple` are top-level `$ref` variants
      // referenced only by `Resp`, with no other typed-reference
      // uses → exclusive-by-use → smooshed: variant data classes
      // extend `Resp` directly, no `RespDetailed`/`RespSimple`
      // wrapper classes survive.
      expect(result, contains('final class Detailed extends Resp'));
      expect(result, contains('final class Simple extends Resp'));
      expect(result, isNot(contains('class RespDetailed ')));
      expect(result, isNot(contains('class RespSimple ')));
      // No FormatException-on-fall-through: the Always fallback means
      // any input shape gets routed to a variant.
      expect(result, isNot(contains('throw UnimplementedError')));
      expect(result, isNot(contains('throw FormatException')));
    });

    test('property-array-item-shape dispatch routes missing/empty '
        'discriminator property to the unguarded last variant', () {
      // github's `validation-error.errors` and
      // `validation-error-simple.errors` are both *optional*. A 422
      // response with no `errors` is spec-legal — the dispatch must
      // not throw on it. Verifying the rendered factory does not emit
      // a fall-through `throw FormatException` for the no-match case.
      final results = renderTestSchemas(
        {
          'Resp': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Detailed'},
              {r'$ref': '#/components/schemas/Simple'},
            ],
          },
          'Detailed': {
            'type': 'object',
            'required': ['message'],
            'properties': {
              'message': {'type': 'string'},
              'errors': {
                'type': 'array',
                'items': {
                  'type': 'object',
                  'properties': {
                    'code': {'type': 'string'},
                  },
                },
              },
            },
          },
          'Simple': {
            'type': 'object',
            'required': ['message'],
            'properties': {
              'message': {'type': 'string'},
              'errors': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final result = results['Resp'];
      // The last arm is the unguarded fallback — no FormatException
      // for the no-match case.
      expect(result, isNot(contains('throw FormatException')));
      // The Detailed arm still has its shape guard.
      expect(
        result,
        contains(
          "if (json['errors'] is List && "
          "(json['errors'] as List).isNotEmpty && "
          "(json['errors'] as List).first is Map<String, dynamic>)",
        ),
      );
    });

    test('property-array-item-shape dispatch bails when the shared array '
        'property items collide on JSON shape', () {
      // Both variants put objects inside `errors` — shape-peeking can't
      // distinguish them, so the picker falls through to the legacy
      // stub.
      final results = renderTestSchemas(
        {
          'Resp': {
            'oneOf': [
              {r'$ref': '#/components/schemas/A'},
              {r'$ref': '#/components/schemas/B'},
            ],
          },
          'A': {
            'type': 'object',
            'required': ['message'],
            'properties': {
              'message': {'type': 'string'},
              'errors': {
                'type': 'array',
                'items': {
                  'type': 'object',
                  'properties': {
                    'code': {'type': 'string'},
                  },
                },
              },
            },
          },
          'B': {
            'type': 'object',
            'required': ['message'],
            'properties': {
              'message': {'type': 'string'},
              'errors': {
                'type': 'array',
                'items': {
                  'type': 'object',
                  'properties': {
                    'reason': {'type': 'string'},
                  },
                },
              },
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      expect(
        results['Resp'],
        contains("throw UnimplementedError('Resp.fromJson')"),
      );
    });

    test('non-discriminator oneOf shape-dispatch with an enum variant '
        '(distinct from a Map<String, dynamic> object variant)', () {
      // The enum's JSON storage type is `String` — same as RenderString,
      // so it would conflict with a String variant; but here it's
      // paired with an object, which uses Map<String, dynamic>. The
      // dispatch picks the enum on String inputs.
      final results = renderTestSchemas(
        {
          'Result': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Status'},
              {r'$ref': '#/components/schemas/Detail'},
            ],
          },
          'Status': {
            'type': 'string',
            'enum': ['ok', 'error'],
          },
          'Detail': {
            'type': 'object',
            'properties': {
              'message': {'type': 'string'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final result = results['Result'];
      expect(result, isNotNull);
      expect(result, contains('factory Result.fromJson(dynamic json)'));
      // `Status` is an enum (can't extend a sealed class) so it keeps
      // its `ResultStatus` wrapper. `Detail` is exclusive-by-use and
      // smooshes — the Map arm constructs `Detail` directly, no
      // wrapper.
      expect(result, contains('String v => ResultStatus(Status.fromJson(v))'));
      expect(
        result,
        contains('Map<String, dynamic> v => Detail.fromJson(v)'),
      );
      expect(result, contains('final class Detail extends Result'));
      expect(result, isNot(contains('class ResultDetail ')));
      expect(result, contains('final Status value;'));
      expect(result, contains('value.toJson()'));
    });

    test('non-discriminator oneOf with two object variants and no '
        'required fields uses optional-tag dispatch', () {
      // Two objects share Map<String, dynamic> at the JSON level so
      // shape dispatch can't fire. Neither has required fields, but
      // each has a unique optional. Property-presence dispatch keys
      // on those.
      final results = renderTestSchemas(
        {
          'Pet': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Cat'},
              {r'$ref': '#/components/schemas/Dog'},
            ],
          },
          'Cat': {
            'type': 'object',
            'properties': {
              'meow': {'type': 'boolean'},
            },
          },
          'Dog': {
            'type': 'object',
            'properties': {
              'bark': {'type': 'boolean'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      expect(
        results['Pet'],
        contains("if (json.containsKey('meow'))"),
      );
    });

    test('non-discriminator oneOf with two object variants and disjoint '
        'required fields uses required-field dispatch', () {
      // Each variant has a property uniquely required by it — pick the
      // variant by checking which key is present.
      final results = renderTestSchemas(
        {
          'Pet': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Cat'},
              {r'$ref': '#/components/schemas/Dog'},
            ],
          },
          'Cat': {
            'type': 'object',
            'properties': {
              'meow': {'type': 'boolean'},
              'shared': {'type': 'string'},
            },
            'required': ['meow', 'shared'],
          },
          'Dog': {
            'type': 'object',
            'properties': {
              'bark': {'type': 'boolean'},
              'shared': {'type': 'string'},
            },
            'required': ['bark', 'shared'],
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final pet = results['Pet'];
      expect(pet, isNotNull);
      expect(pet, contains('factory Pet.fromJson(Map<String, dynamic> json)'));
      // `Cat`/`Dog` are exclusive-by-use top-level variants → smooshed.
      // The if-arms construct each variant directly; the variant data
      // classes are inlined into `pet.dart` as direct sealed
      // subclasses (no `PetCat`/`PetDog` wrappers).
      expect(pet, contains("if (json.containsKey('meow'))"));
      expect(pet, contains('return Cat.fromJson(json)'));
      expect(pet, contains("if (json.containsKey('bark'))"));
      expect(pet, contains('return Dog.fromJson(json)'));
      expect(pet, contains('No variant of Pet matched json keys'));
      expect(pet, contains('final class Cat extends Pet'));
      expect(pet, contains('final class Dog extends Pet'));
      expect(pet, isNot(contains('class PetCat ')));
      expect(pet, isNot(contains('class PetDog ')));
    });

    test('wrapper subclass uses position-based name when the variant '
        'tag would double the parent prefix (non-smooshed path)', () {
      // Inline oneOf variants get parser-synthesized names that
      // already contain the parent (`<Parent>OneOf<i>`). Composing
      // the wrapper as `<Parent><variantTypeName>` would then double
      // the prefix (e.g. `TestTestOneOf1`). The naming pass detects
      // this and falls back to a position-based wrapper name
      // (`TestVariant1`).
      //
      // Every dispatch kind now smooshes inline `ResolvedObject` and
      // `ResolvedAllOf` variants, so the doubling-fallback never
      // fires for those anymore. To exercise the fallback we need an
      // inline variant that's neither — an inline `ResolvedEnum`
      // qualifies. The structural smoosh predicate excludes enums,
      // so the wrapper still gets emitted and trips the doubling
      // check. (This mirrors github's `gists_create_request_public`,
      // which has `oneOf: [boolean, string-enum]`.)
      final result = renderTestSchema({
        'oneOf': [
          {'type': 'boolean'},
          {
            'type': 'string',
            'enum': ['true', 'false'],
          },
        ],
      });
      // The boolean variant gets the structural `TestBool` wrapper.
      expect(result, contains('final class TestBool extends Test'));
      // The inline enum variant's parser-synthesized name starts
      // with the parent (`TestOneOf1`), so naive composition would
      // give `TestTestOneOf1`; the fallback collapses to
      // `TestVariant1`.
      expect(result, contains('final class TestVariant1 extends Test'));
      expect(result, contains('final TestOneOf1 value;'));
      expect(result, isNot(contains('TestTestOneOf')));
    });

    test('predicate-required dispatch smooshes inline-object variants: '
        'no wrapper class, case arm calls variant directly', () {
      // Inline object variants of a oneOf that uses predicate-required
      // dispatch are smooshed: no wrapper subclass is emitted in the
      // sealed parent's file, and dispatch case arms construct the
      // variant directly instead of wrapping it. The variant data
      // class itself becomes the sealed subclass — that side of the
      // change is rendered into a separate variant file and
      // verified by the github regen integration check (and by file_
      // renderer-level tests for the variant's `extends` clause).
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'object',
            'required': ['note'],
            'properties': {
              'note': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'required': ['content_id'],
            'properties': {
              'content_id': {'type': 'integer'},
            },
          },
        ],
      });
      // Case arms call the variant data class directly — no outer
      // wrapper-class call.
      expect(
        result,
        contains(
          "if (json.containsKey('note')) {\n            "
          'return TestOneOf0.fromJson(json);',
        ),
      );
      expect(
        result,
        contains(
          "if (json.containsKey('content_id')) {\n            "
          'return TestOneOf1.fromJson(json);',
        ),
      );
      // Variant data classes are inlined into the parent's file as
      // direct sealed subclasses (Dart's `sealed` modifier requires
      // them in the same library). Their `toJson` is an `@override`
      // of the sealed parent's abstract method.
      expect(result, contains('final class TestOneOf0 extends Test'));
      expect(result, contains('final class TestOneOf1 extends Test'));
      expect(result, contains('@override'));
      // No wrapper subclasses survive in the parent file: there's no
      // `<Parent>Variant<i>`, and no `final <VariantClass> value;`
      // (which would be the wrapper's `value` field).
      expect(result, isNot(contains('class TestVariant0')));
      expect(result, isNot(contains('TestOneOf0 value')));
      expect(result, isNot(contains('TestOneOf1 value')));
    });

    test('shape dispatch smooshes the inline-object variant: case arm '
        'calls variant directly, primitive variants keep wrappers', () {
      // Mixed-shape `oneOf` where one variant is an inline object
      // and the other is a primitive (e.g. github's
      // `repos_*_team_access_restrictions_request`: object-or-array
      // shape). The object variant is inline and exclusive — smoosh
      // eligible; the primitive can't extend a sealed class so it
      // keeps its wrapper. The mixed result demonstrates the per-arm
      // smoosh decision.
      final result = renderTestSchema({
        'oneOf': [
          {'type': 'string'},
          {
            'type': 'object',
            'properties': {
              'name': {'type': 'string'},
            },
          },
        ],
      });
      // String variant keeps the structural wrapper.
      expect(result, contains('final class TestString extends Test'));
      expect(result, contains('String v => TestString(v)'));
      // Inline-object variant smooshes — case arm constructs it
      // directly, no wrapper-class call. Variant data class is the
      // sealed subclass.
      expect(
        result,
        contains('Map<String, dynamic> v => TestOneOf1.fromJson(v)'),
      );
      expect(result, contains('final class TestOneOf1 extends Test'));
      expect(result, contains('@override'));
      // No wrapper subclass for the smooshed variant.
      expect(result, isNot(contains('class TestVariant1')));
      expect(result, isNot(contains('TestOneOf1 value')));
    });

    test('hybrid dispatch smooshes inline-object Map sub-arms: each '
        'variant extends the sealed parent directly', () {
      // String + 2 inline-object variants — hybrid dispatch (string
      // shape arm + property-presence sub-dispatch on the Maps). Both
      // map variants are inline-exclusive `ResolvedObject`s, so they
      // smoosh: the Map case arms call the variant directly, the
      // wrapper subclasses are gone, and the variant data classes
      // are inlined into the parent's file.
      final result = renderTestSchema({
        'oneOf': [
          {'type': 'string'},
          {
            'type': 'object',
            'required': ['tag_a'],
            'properties': {
              'tag_a': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'required': ['tag_b'],
            'properties': {
              'tag_b': {'type': 'string'},
            },
          },
        ],
      });
      // String shape-arm keeps its wrapper (primitives can't extend
      // a sealed class).
      expect(result, contains('final class TestString extends Test'));
      // Map sub-arms call the variant directly — no wrapper-class
      // outer call.
      expect(
        result,
        contains(
          "final Map<String, dynamic> v when v.containsKey('tag_a') "
          '=> TestOneOf1.fromJson(v)',
        ),
      );
      expect(
        result,
        contains(
          "final Map<String, dynamic> v when v.containsKey('tag_b') "
          '=> TestOneOf2.fromJson(v)',
        ),
      );
      // Variant data classes are sealed subclasses, inlined.
      expect(result, contains('final class TestOneOf1 extends Test'));
      expect(result, contains('final class TestOneOf2 extends Test'));
      // No legacy `<Parent>Variant<i>` wrappers.
      expect(result, isNot(contains('class TestVariant1')));
      expect(result, isNot(contains('class TestVariant2')));
      expect(result, isNot(contains('TestOneOf1 value')));
      expect(result, isNot(contains('TestOneOf2 value')));
    });

    test('property-presence dispatch falls back to legacy when one '
        'variant has nothing unique at all', () {
      // Cat requires {a, b}; Dog requires {a, b} too with the same
      // properties — neither variant has anything unique (required
      // or optional). With two would-be-fallback variants the
      // dispatch is ambiguous and falls through to the legacy stub.
      final results = renderTestSchemas(
        {
          'Pet': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Cat'},
              {r'$ref': '#/components/schemas/Dog'},
            ],
          },
          'Cat': {
            'type': 'object',
            'properties': {
              'a': {'type': 'string'},
              'b': {'type': 'string'},
            },
            'required': ['a', 'b'],
          },
          'Dog': {
            'type': 'object',
            'properties': {
              'a': {'type': 'string'},
              'b': {'type': 'string'},
            },
            'required': ['a', 'b'],
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      expect(
        results['Pet'],
        contains("throw UnimplementedError('Pet.fromJson')"),
      );
    });

    test('required-field dispatch with one no-required variant uses it as '
        'the fallback', () {
      // SimpleUser-like A requires {login, id}; B has no required at
      // all. Required-field dispatch picks A on `id` (or `login`),
      // and falls through to B as the catch-all. No throw.
      final results = renderTestSchemas(
        {
          'Author': {
            'oneOf': [
              {r'$ref': '#/components/schemas/SimpleUser'},
              {r'$ref': '#/components/schemas/EmptyAuthor'},
            ],
          },
          'SimpleUser': {
            'type': 'object',
            'properties': {
              'login': {'type': 'string'},
              'id': {'type': 'integer'},
            },
            'required': ['login', 'id'],
          },
          'EmptyAuthor': {
            'type': 'object',
            'properties': <String, dynamic>{},
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final author = results['Author'];
      expect(author, isNotNull);
      // `SimpleUser` is `ResolvedObject` and exclusive-by-use →
      // smooshed; the checked arm constructs it directly.
      // `EmptyAuthor` (no properties) parses as `SchemaEmptyObject`
      // → `ResolvedEmptyObject`, which the smoosh predicate excludes
      // (only `ResolvedObject` has a class body to extend). It keeps
      // its `AuthorEmptyAuthor` wrapper as the fallback arm.
      expect(author, contains("if (json.containsKey('id'))"));
      expect(author, contains('return SimpleUser.fromJson(json)'));
      expect(author, contains('final class SimpleUser extends Author'));
      expect(author, isNot(contains('class AuthorSimpleUser ')));
      expect(
        author,
        contains('return AuthorEmptyAuthor(EmptyAuthor.fromJson(json));'),
      );
      expect(author, contains('final class AuthorEmptyAuthor extends Author'));
      expect(author, isNot(contains('throw FormatException')));
      expect(author, isNot(contains('throw UnimplementedError')));
    });

    test('hybrid dispatch: array variant + multiple objects with disjoint '
        'required uses shape-then-required-field', () {
      // Github's `repos/get-content` 200 response shape: an array
      // variant (`content-directory`) plus three object variants
      // (`content-file` keyed on `content`, `content-symlink` keyed on
      // `target`, `content-submodule` keyed on `submodule_git_url`).
      // Pure shape dispatch fails because all three objects collide
      // on `Map<String, dynamic>`; pure required-field fails because
      // the array variant isn't an object. Hybrid: shape-arm the
      // array, then required-field-dispatch the objects in a Map
      // sub-arm.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
          {
            'type': 'object',
            'required': ['content'],
            'properties': {
              'content': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'required': ['target'],
            'properties': {
              'target': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'required': ['submodule_git_url'],
            'properties': {
              'submodule_git_url': {'type': 'string'},
            },
          },
        ],
      });
      // Outer shape arm for the array.
      expect(result, contains('final List<dynamic> v => TestList'));
      // Inner required-field arms for the three objects, guarded by
      // `when v.containsKey('...')`.
      expect(
        result,
        contains("final Map<String, dynamic> v when v.containsKey('content')"),
      );
      expect(
        result,
        contains("final Map<String, dynamic> v when v.containsKey('target')"),
      );
      expect(
        result,
        contains(
          'final Map<String, dynamic> v '
          "when v.containsKey('submodule_git_url')",
        ),
      );
      // No legacy stub.
      expect(result, isNot(contains('throw UnimplementedError')));
      // The List variant keeps its primitive wrapper. The three
      // inline-object variants smoosh — they extend the sealed
      // parent directly, no `<Parent>Variant<i>` wrapper, no
      // `value:` indirection. Map case arms call the variant's
      // `fromJson` directly.
      expect(result, contains('final class TestList extends Test'));
      expect(result, contains('final List<String> value;'));
      expect(result, contains('final class TestOneOf1 extends Test'));
      expect(result, contains('final class TestOneOf2 extends Test'));
      expect(result, contains('final class TestOneOf3 extends Test'));
      expect(
        result,
        contains(
          "final Map<String, dynamic> v when v.containsKey('content') "
          '=> TestOneOf1.fromJson(v)',
        ),
      );
    });

    test('hybrid dispatch: Map sub-arms include a fallback when one '
        'object has no unique props', () {
      // String variant + two object variants where Tagged has unique
      // `tag` and Anything has nothing unique. The Map sub-dispatch
      // emits an unguarded `final Map<String, dynamic> v =>` arm
      // pointing at the fallback variant — no Map-specific throw.
      final result = renderTestSchema({
        'oneOf': [
          {'type': 'string'},
          {
            'type': 'object',
            'required': ['tag'],
            'properties': {
              'tag': {'type': 'string'},
            },
          },
          {'type': 'object', 'properties': <String, dynamic>{}},
        ],
      });
      // Outer shape arm for the string.
      expect(result, contains('final String v =>'));
      // Map sub-arms — checked then fallback.
      expect(
        result,
        contains("final Map<String, dynamic> v when v.containsKey('tag')"),
      );
      // The Map fallback uses an unguarded arm (no `when`).
      expect(
        result,
        matches(
          RegExp(r'final Map<String, dynamic> v\s*=>\s*Test'),
        ),
      );
      // No "no Map variant matched" throw — the fallback handles it.
      expect(result, isNot(contains('No variant of Test matched json keys')));
    });

    test('hybrid dispatch bails when Map variants are not '
        'required-field dispatchable', () {
      // String variant + two object variants that share both their
      // required and optional sets. The Map sub-dispatch can't pick
      // one over the other, so the whole hybrid plan bails and we
      // fall through to the legacy stub.
      final result = renderTestSchema({
        'oneOf': [
          {'type': 'string'},
          {
            'type': 'object',
            'required': ['shared'],
            'properties': {
              'shared': {'type': 'string'},
            },
          },
          {
            'type': 'object',
            'required': ['shared'],
            'properties': {
              'shared': {'type': 'string'},
            },
          },
        ],
      });
      expect(result, contains('throw UnimplementedError'));
    });

    test('hybrid dispatch sub-dispatches multiple array variants by '
        'first-element shape', () {
      // Two array variants (array<string> vs array<int>) alongside a
      // single object variant. The two arrays collide on
      // `List<dynamic>` shape; hybrid sub-dispatches them by peeking
      // the first element's runtime type. The lone object variant is
      // a single shape arm (no sub-dispatch needed).
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
          {
            'type': 'array',
            'items': {'type': 'integer'},
          },
          {
            'type': 'object',
            'required': ['note'],
            'properties': {
              'note': {'type': 'string'},
            },
          },
        ],
      });
      // Single-Map-variant shape arm (the object is smooshed but its
      // case-arm still matches `Map<String, dynamic>`).
      expect(result, contains('final Map<String, dynamic> v =>'));
      // List sub-dispatch arms — peek the first element's type.
      expect(
        result,
        contains(
          'final List<dynamic> v when v.isNotEmpty && v.first is String',
        ),
      );
      expect(
        result,
        contains('final List<dynamic> v when v.isNotEmpty && v.first is int'),
      );
      // Sub-dispatch falls through to a List-specific throw, not the
      // outer "Unsupported shape" throw.
      expect(
        result,
        contains('No variant of Test matched first list element'),
      );
      // No legacy stub.
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('hybrid multi-array sub-dispatch picks an unguarded '
        'fallback when one variant has open-shape items', () {
      // Two list variants: `array<string>` (pinnable to `String`)
      // and `array<DateTime>` (string-format-date-time — pinnable
      // to nothing in particular, since DateTime serializes back
      // to a JSON string and would collide with the bare-string
      // arm). Plus an object variant. The DateTime-items array
      // gets the unguarded fallback at the end of the list sub-
      // dispatch; the string-items array is guarded by `first is
      // String`.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
          {
            'type': 'array',
            'items': {'type': 'string', 'format': 'date-time'},
          },
          {
            'type': 'object',
            'required': ['note'],
            'properties': {
              'note': {'type': 'string'},
            },
          },
        ],
      });
      // String-items arm guarded.
      expect(
        result,
        contains(
          'final List<dynamic> v when v.isNotEmpty && v.first is String',
        ),
      );
      // DateTime-items arm is the unguarded fallback (no `when`
      // clause — bare `final List<dynamic> v => ...`).
      expect(
        result,
        contains('final List<dynamic> v => '),
      );
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('property-array-element-shape dispatch picks object variants '
        'that differ only in an array property element type', () {
      // Github's `issues/add-labels` request body: two object variants
      // with the same property set, both having only optional
      // `labels` of array type but with different element types
      // (`array<string>` vs `array<object>`). Required-field dispatch
      // can't tell them apart (both are fallbacks); the property-
      // array-element-shape predicate peeks `labels[0]` runtime type.
      // Last variant is the unguarded fallback when `labels` is
      // missing or empty (since the property is optional).
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'object',
            'properties': {
              'labels': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
          {
            'type': 'object',
            'properties': {
              'labels': {
                'type': 'array',
                'items': {
                  'type': 'object',
                  'properties': {
                    'name': {'type': 'string'},
                  },
                  'required': ['name'],
                },
              },
            },
          },
        ],
      });
      // First variant guarded by `labels[0] is String`. Uses the
      // `PropertyArrayItemShape` predicate (shared with the
      // validation-error twins case from #177).
      expect(
        result,
        contains(
          "if (json['labels'] is List && "
          "(json['labels'] as List).isNotEmpty && "
          "(json['labels'] as List).first is String)",
        ),
      );
      // Second variant is the unguarded fallback (last `return ...;`
      // with no `if` since `labels` is optional).
      expect(result, isNot(contains('throw UnimplementedError')));
      expect(result, isNot(contains('throw FormatException')));
    });

    test('property-array-element-shape dispatch bails when the only '
        'array-typed property has the same items shape across variants', () {
      // Both variants have `labels: array<string>`. Same shape →
      // not a discriminator. Other properties also identical
      // (empty). No way to dispatch; bail.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'object',
            'properties': {
              'labels': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
          {
            'type': 'object',
            'properties': {
              'labels': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
        ],
      });
      expect(result, contains('throw UnimplementedError'));
    });

    test('hybrid dispatch combines multi-array sub-dispatch and '
        'property-array-element-shape Map sub-dispatch (github labels '
        'case)', () {
      // Github's `issues/add-labels` request body: 5 variants —
      // {labels?: array<string>}, array<string>, {labels?:
      // array<object>}, array<object>, string. Two non-collision
      // shapes (string only). Two Map variants distinguishable only
      // by `labels[0]` element type. Two List variants distinguishable
      // only by `[0]` element type. Hybrid handles both sub-dispatches
      // simultaneously.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'object',
            'properties': {
              'labels': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
          {
            'type': 'array',
            'items': {'type': 'string'},
          },
          {
            'type': 'object',
            'properties': {
              'labels': {
                'type': 'array',
                'items': {
                  'type': 'object',
                  'properties': {
                    'name': {'type': 'string'},
                  },
                  'required': ['name'],
                },
              },
            },
          },
          {
            'type': 'array',
            'items': {
              'type': 'object',
              'properties': {
                'name': {'type': 'string'},
              },
              'required': ['name'],
            },
          },
          {'type': 'string'},
        ],
      });
      // No legacy stub.
      expect(result, isNot(contains('throw UnimplementedError')));
      // String shape arm.
      expect(result, contains('final String v =>'));
      // Map sub-dispatch — first variant guarded by `labels[0] is
      // String`, second is the fallback (unguarded `Map<String, …> v
      // =>`).
      expect(
        result,
        contains(
          'final Map<String, dynamic> v when '
          "v['labels'] is List && "
          "(v['labels'] as List).isNotEmpty && "
          "(v['labels'] as List).first is String "
          '=> TestOneOf0.fromJson(v)',
        ),
      );
      expect(
        result,
        contains('final Map<String, dynamic> v => TestOneOf2.fromJson(v)'),
      );
      // List sub-dispatch — peek `[0]` type.
      expect(
        result,
        contains(
          'final List<dynamic> v when v.isNotEmpty && v.first is String',
        ),
      );
      expect(
        result,
        contains(
          'when v.isNotEmpty && v.first is Map<String, dynamic>',
        ),
      );
      // List sub-dispatch fallback throw.
      expect(
        result,
        contains('No variant of Test matched first list element'),
      );
    });

    test('property-presence dispatch falls back to optional-unique tags '
        'when a sibling has no unique fields (the fallback)', () {
      // Github's `environment.protection_rules.items` shape: three
      // variants share `[id, node_id, type]` as required and differ
      // only in optional fields. WaitTimer has unique optional
      // `wait_timer`; ReviewersRule has `reviewers`; BranchPolicy has
      // no unique fields and acts as the fallback.
      final results = renderTestSchemas(
        {
          'Rule': {
            'oneOf': [
              {r'$ref': '#/components/schemas/WaitTimer'},
              {r'$ref': '#/components/schemas/ReviewersRule'},
              {r'$ref': '#/components/schemas/BranchPolicy'},
            ],
          },
          'WaitTimer': {
            'type': 'object',
            'required': ['id', 'node_id', 'type'],
            'properties': {
              'id': {'type': 'integer'},
              'node_id': {'type': 'string'},
              'type': {'type': 'string'},
              'wait_timer': {'type': 'integer'},
            },
          },
          'ReviewersRule': {
            'type': 'object',
            'required': ['id', 'node_id', 'type'],
            'properties': {
              'id': {'type': 'integer'},
              'node_id': {'type': 'string'},
              'type': {'type': 'string'},
              'reviewers': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
          'BranchPolicy': {
            'type': 'object',
            'required': ['id', 'node_id', 'type'],
            'properties': {
              'id': {'type': 'integer'},
              'node_id': {'type': 'string'},
              'type': {'type': 'string'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final rule = results['Rule'];
      expect(rule, isNotNull);
      // All three variants are exclusive-by-use top-level → smooshed.
      expect(rule, contains("if (json.containsKey('wait_timer'))"));
      expect(rule, contains('return WaitTimer.fromJson(json)'));
      expect(rule, contains("if (json.containsKey('reviewers'))"));
      expect(rule, contains('return ReviewersRule.fromJson(json)'));
      expect(rule, contains('return BranchPolicy.fromJson(json);'));
      expect(rule, contains('final class WaitTimer extends Rule'));
      expect(rule, contains('final class ReviewersRule extends Rule'));
      expect(rule, contains('final class BranchPolicy extends Rule'));
      expect(rule, isNot(contains('class RuleWaitTimer ')));
      expect(rule, isNot(contains('class RuleReviewersRule ')));
      expect(rule, isNot(contains('class RuleBranchPolicy ')));
      expect(rule, isNot(contains('throw UnimplementedError')));
      expect(rule, isNot(contains('throw FormatException')));
    });

    test('optional-tag dispatch with no fallback uses throw at end', () {
      // Github's `git/create-blob` 422 shape: two error variants
      // share `[message]` as a common optional but each has its own
      // unique optional (`url` for Basic, `metadata` for Violation).
      // No fallback exists, so the dispatch emits a throw at the end
      // for "neither tag present" — best-effort: github's actual
      // responses always emit one or the other.
      final results = renderTestSchemas(
        {
          'Err': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Basic'},
              {r'$ref': '#/components/schemas/Violation'},
            ],
          },
          'Basic': {
            'type': 'object',
            'properties': {
              'message': {'type': 'string'},
              'url': {'type': 'string'},
            },
          },
          'Violation': {
            'type': 'object',
            'properties': {
              'message': {'type': 'string'},
              'metadata': {'type': 'string'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final err = results['Err'];
      expect(err, contains("if (json.containsKey('url'))"));
      expect(err, contains("if (json.containsKey('metadata'))"));
      expect(err, contains('throw FormatException'));
      expect(err, isNot(contains('throw UnimplementedError')));
    });

    test('required-tag uniqueness on the pure path is strict — a sibling '
        'that lists the tag as optional disqualifies it', () {
      // Github's `git/create-blob` 422 shape: a `validation-error`
      // requires `[documentation_url, message]`; a
      // `repository-rule-violation-error` lists those as optional
      // (and emits them in real responses). Loose required-uniqueness
      // would tag validation on `documentation_url` and misclassify
      // every violation response. The pure required-field path keeps
      // strict uniqueness — falls through to optional-strict, which
      // tags on `errors` (only validation has it) and `metadata`
      // (only violation has it).
      final results = renderTestSchemas(
        {
          'Err': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Validation'},
              {r'$ref': '#/components/schemas/Violation'},
            ],
          },
          'Validation': {
            'type': 'object',
            'required': ['documentation_url', 'message'],
            'properties': {
              'documentation_url': {'type': 'string'},
              'message': {'type': 'string'},
              'errors': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          },
          'Violation': {
            'type': 'object',
            'properties': {
              'documentation_url': {'type': 'string'},
              'message': {'type': 'string'},
              'metadata': {'type': 'string'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final err = results['Err'];
      // Strict-required failed (documentation_url is in violation's
      // props), so the dispatch falls through to strict-optional:
      // `errors` for validation, `metadata` for violation.
      expect(err, contains("if (json.containsKey('errors'))"));
      expect(err, contains("if (json.containsKey('metadata'))"));
      // The forbidden loose dispatch tag — a violation response that
      // emits `documentation_url` (which github does) would
      // misclassify as validation if this fired.
      expect(
        err,
        isNot(contains("if (json.containsKey('documentation_url'))")),
      );
    });

    test('oneOf with discriminator but no mapping falls through to '
        'shape dispatch (implicit-mapping not yet supported)', () {
      // No `mapping` key — discriminator-dispatch needs the explicit
      // table, so we drop into the shape-dispatch path. With a single
      // object variant, shape dispatch trivially picks it.
      final results = renderTestSchemas(
        {
          'Pet': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Cat'},
            ],
            'discriminator': {'propertyName': 'pet_type'},
          },
          'Cat': {
            'type': 'object',
            'properties': {
              'pet_type': {'type': 'string'},
            },
            'required': ['pet_type'],
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final pet = results['Pet'];
      expect(pet, contains('factory Pet.fromJson(dynamic json)'));
      // `Cat` is exclusive-by-use → smooshed; the Map case arm
      // constructs `Cat` directly, no `PetCat` wrapper.
      expect(pet, contains('Map<String, dynamic> v => Cat.fromJson(v)'));
      expect(pet, contains('final class Cat extends Pet'));
      expect(pet, isNot(contains('class PetCat ')));
      expect(pet, isNot(contains('UnimplementedError')));
    });

    test('non-discriminator oneOf whose object variants each tag '
        'themselves with a single-value enum property uses '
        'implicit-discriminator dispatch', () {
      // github's `repository-rule` shape: no explicit discriminator,
      // but every variant has a required `type` property whose enum
      // has a single, variant-unique value. Treat that as an implicit
      // discriminator so we generate real dispatch instead of a stub.
      final results = renderTestSchemas(
        {
          'Rule': {
            'oneOf': [
              {r'$ref': '#/components/schemas/Creation'},
              {r'$ref': '#/components/schemas/Deletion'},
            ],
          },
          'Creation': {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['creation'],
              },
            },
            'required': ['type'],
          },
          'Deletion': {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['deletion'],
              },
            },
            'required': ['type'],
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final rule = results['Rule'];
      expect(rule, isNotNull);
      expect(rule, contains('sealed class Rule'));
      expect(
        rule,
        contains('factory Rule.fromJson(Map<String, dynamic> json)'),
      );
      expect(rule, contains("final discriminator = json['type']"));
      // `Creation` and `Deletion` are exclusive-by-use top-level
      // variants — they smoosh into `Rule` (no wrapper class, case
      // arms construct each variant directly).
      expect(rule, contains("'creation' => Creation.fromJson(json)"));
      expect(rule, contains("'deletion' => Deletion.fromJson(json)"));
      expect(rule, contains('final class Creation extends Rule'));
      expect(rule, contains('final class Deletion extends Rule'));
      expect(rule, isNot(contains('class RuleCreation ')));
      expect(rule, isNot(contains('class RuleDeletion ')));
      expect(rule, isNot(contains('UnimplementedError')));
    });

    test('discriminator dispatch smooshes inline-object variants: case '
        'arms call the variant directly, no wrapper class', () {
      // Same shape as the implicit-discriminator test above, but
      // variants are *inline* under the parent's oneOf rather than
      // top-level `$ref`s. Inline variants are exclusive to one
      // parent by construction (their pointer is `<parent>/oneOf/<i>`),
      // so they smoosh: the variant data class itself extends the
      // sealed parent, eliminating the wrapper-class shim and the
      // `value:` indirection. Top-level `$ref` variants smoosh too
      // when they're "exclusive-by-use" (referenced as a variant of
      // exactly one parent and from no other slot) — covered by the
      // implicit-discriminator test above.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['creation'],
              },
            },
            'required': ['type'],
          },
          {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['deletion'],
              },
            },
            'required': ['type'],
          },
        ],
      });
      // Discriminator dispatch with case arms calling the variant
      // directly — no `<Wrapper>(<Variant>.fromJson(...))` outer call.
      expect(result, contains("final discriminator = json['type']"));
      expect(result, contains("'creation' => TestOneOf0.fromJson(json)"));
      expect(result, contains("'deletion' => TestOneOf1.fromJson(json)"));
      // Variant data classes are inlined into the parent's file as
      // direct sealed subclasses with `@override` on `toJson`.
      expect(result, contains('final class TestOneOf0 extends Test'));
      expect(result, contains('final class TestOneOf1 extends Test'));
      expect(result, contains('@override'));
      // No wrapper subclasses survive in the parent file.
      expect(result, isNot(contains('class TestVariant0')));
      expect(result, isNot(contains('TestOneOf0 value')));
      expect(result, isNot(contains('TestOneOf1 value')));
    });

    test('shape dispatch picks oneOf<int-enum, object> with int + Map '
        'arms', () {
      // Integer enums report `int` as their shape key (matches
      // RenderInteger's non-newtype convention). A oneOf with an
      // int-enum and an object variant shape-dispatches on those
      // distinct keys.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'integer',
            'enum': [1, 2, 3],
          },
          {
            'type': 'object',
            'properties': {
              'name': {'type': 'string'},
            },
          },
        ],
      });
      expect(result, contains('int v => '));
      expect(result, contains('Map<String, dynamic> v =>'));
      expect(result, isNot(contains('throw UnimplementedError')));
    });

    test('discriminator dispatch with integer-typed tags emits int '
        'case arms, not string', () {
      // Mirrors Discord's component-type pattern: each variant tags
      // itself with `type: { type: integer, enum: [N] }` for distinct
      // N. The generated switch must use raw int literals (`case 1:`)
      // not strings (`case '1':`); the lookup is `json['type']`.
      final result = renderTestSchema({
        'oneOf': [
          {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'integer',
                'enum': [1],
              },
            },
            'required': ['type'],
          },
          {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'integer',
                'enum': [11],
              },
            },
            'required': ['type'],
          },
        ],
      });
      expect(result, contains("final discriminator = json['type']"));
      expect(result, contains('1 => TestOneOf0.fromJson(json)'));
      expect(result, contains('11 => TestOneOf1.fromJson(json)'));
      // No quoted-int case keys.
      expect(result, isNot(contains("'1' =>")));
      expect(result, isNot(contains("'11' =>")));
    });

    test('discriminator dispatch smooshes inline-allOf variants: the '
        'merged class extends the sealed parent directly', () {
      // github's `repository-rule-detailed` shape: each oneOf variant
      // is `allOf: [<rule-X>, <ruleset-info>]`, where the rule-X
      // member carries the discriminator (`type` is a single-value
      // enum). The synthesized merged class smooshes — extends the
      // sealed parent, no separate wrapper, dispatch case arms call
      // it directly.
      final results = renderTestSchemas(
        {
          'Rule': {
            'oneOf': [
              {
                'allOf': [
                  {r'$ref': '#/components/schemas/Creation'},
                  {r'$ref': '#/components/schemas/Meta'},
                ],
              },
              {
                'allOf': [
                  {r'$ref': '#/components/schemas/Deletion'},
                  {r'$ref': '#/components/schemas/Meta'},
                ],
              },
            ],
          },
          'Creation': {
            'type': 'object',
            'required': ['type'],
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['creation'],
              },
            },
          },
          'Deletion': {
            'type': 'object',
            'required': ['type'],
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['deletion'],
              },
            },
          },
          'Meta': {
            'type': 'object',
            'required': ['ruleset_id'],
            'properties': {
              'ruleset_id': {'type': 'integer'},
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      final rule = results['Rule']!;
      // Discriminator dispatch on `type` calls the merged class
      // directly — no `<Wrapper>(<Merged>.fromJson(...))` outer call.
      expect(rule, contains("final discriminator = json['type']"));
      expect(rule, contains("'creation' => RuleOneOf0.fromJson(json)"));
      expect(rule, contains("'deletion' => RuleOneOf1.fromJson(json)"));
      // Each merged class is inlined into the parent's file as a
      // direct sealed subclass.
      expect(rule, contains('final class RuleOneOf0 extends Rule'));
      expect(rule, contains('final class RuleOneOf1 extends Rule'));
      // Merged properties from both allOf members are present in the
      // smooshed class.
      expect(rule, contains('this.rulesetId'));
      // No wrapper subclasses survive in the parent file.
      expect(rule, isNot(contains('class RuleVariant0')));
      expect(rule, isNot(contains('RuleOneOf0 value')));
      expect(rule, isNot(contains('RuleOneOf1 value')));
    });

    test('implicit-discriminator dispatch falls back when the single-enum '
        'values collide across variants', () {
      // Both variants tag themselves `type: 'creation'` — no unique
      // dispatch value, so we can't pick a variant from the JSON.
      final results = renderTestSchemas(
        {
          'Rule': {
            'oneOf': [
              {r'$ref': '#/components/schemas/A'},
              {r'$ref': '#/components/schemas/B'},
            ],
          },
          'A': {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['creation'],
              },
            },
            'required': ['type'],
          },
          'B': {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['creation'],
              },
            },
            'required': ['type'],
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      expect(
        results['Rule'],
        contains("throw UnimplementedError('Rule.fromJson')"),
      );
    });

    test('implicit-discriminator dispatch ignores a tag property that is '
        'not required by every variant', () {
      // `type` is single-enum on both, but optional on B. An absent
      // discriminator field would crash dispatch, so don't bite.
      final results = renderTestSchemas(
        {
          'Rule': {
            'oneOf': [
              {r'$ref': '#/components/schemas/A'},
              {r'$ref': '#/components/schemas/B'},
            ],
          },
          'A': {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['a'],
              },
            },
            'required': ['type'],
          },
          'B': {
            'type': 'object',
            'properties': {
              'type': {
                'type': 'string',
                'enum': ['b'],
              },
            },
          },
        },
        specUrl: Uri.parse('file:///spec.yaml'),
      );
      // The implicit-discriminator gate on `type` is the contract
      // here — we must NOT switch on `json['type']` over 'a' / 'b',
      // because B doesn't require `type`. Required-field-with-fallback
      // dispatch happens to pick this up legitimately (A is keyed on
      // `type`, B is the fallback), which is fine; just verify the
      // implicit-discriminator path didn't engage.
      expect(results['Rule'], isNot(contains("'a' =>")));
      expect(results['Rule'], isNot(contains('switch (discriminator)')));
    });

    group('anyOf', () {
      test('two pod types', () {
        final schema = {
          'anyOf': [
            {'type': 'string'},
            {'type': 'number'},
          ],
        };
        final result = renderTestSchema(schema);
        // anyOf currently renders as a oneOf, which is wrong — but it
        // is at least dispatched on shape now that RenderNumber has a
        // shape key. The legacy stub here is gone.
        expect(result, contains('String v => TestString(v)'));
        expect(result, contains('num v => TestNum(v)'));
        expect(result, isNot(contains('throw UnimplementedError')));
      });

      test('two object types', () {
        // This tests the case where one is type=null and the other is a ref.
        // This is useful for when you have an existing object that you want to
        // make nullable, but also need the property to be required.
        // The GitHub spec uses this for installation.suspended_by to make
        // simple_user nullable but suspended_by still required.
        final schemas = {
          'User': {
            'type': 'object',
            'properties': {
              'foo': {
                'anyOf': [
                  {'type': 'null'},
                  {r'$ref': '#/components/schemas/Value'},
                ],
              },
            },
            'required': ['foo'],
          },
          'Value': {
            'type': 'object',
            'properties': {
              'bar': {'type': 'number'},
            },
          },
        };
        final results = renderTestSchemas(
          schemas,
          specUrl: Uri.parse('file:///spec.yaml'),
        );
        final user = results['User'];
        expect(
          user,
          '@immutable\n'
          'class User {\n'
          '    User(\n'
          '        { required this.foo, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [User].\n'
          '    factory User.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('User', json, () => User(\n"
          "            foo: Value.maybeFromJson(checkedKey(json, 'foo') as Map<String, dynamic>?),\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static User? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return User.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final Value? foo;\n'
          '\n'
          '    /// Converts a [User] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'foo': foo?.toJson(),\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          foo.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is User\n'
          '            && this.foo == other.foo\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });

    test('map type', () {
      final schema = {
        'type': 'object',
        'properties': {
          'map': {
            'type': 'object',
            'additionalProperties': {'type': 'string'},
          },
        },
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.map, \n'
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            map: (json['map'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value as String)),\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final Map<String, String>? map;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'map': map,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          mapHash(map).hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && mapsEqual(this.map, other.map)\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    test('map type with pod types', () {
      final schema = {
        'type': 'object',
        'properties': {
          'm_string': {
            'type': 'object',
            'additionalProperties': {'type': 'string'},
          },
          'm_int': {
            'type': 'object',
            'additionalProperties': {'type': 'integer'},
          },
          'm_number': {
            'type': 'object',
            'additionalProperties': {'type': 'number'},
          },
          'm_boolean': {
            'type': 'object',
            'additionalProperties': {'type': 'boolean'},
          },
          'm_date_time': {
            'type': 'object',
            'additionalProperties': {'type': 'string', 'format': 'date-time'},
          },
          'm_uri': {
            'type': 'object',
            'additionalProperties': {'type': 'string', 'format': 'uri'},
          },
          'm_map_of_string': {
            'type': 'object',
            'additionalProperties': {
              'type': 'object',
              'additionalProperties': {'type': 'string'},
            },
          },
          'm_enum': {
            'type': 'object',
            'additionalProperties': {
              'type': 'string',
              'enum': ['a', 'b', 'c'],
            },
          },
          'm_unknown': {'type': 'object', 'additionalProperties': true},
        },
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.mString, this.mInt, this.mNumber, this.mBoolean, this.mDateTime, this.mUri, this.mMapOfString, this.mEnum, this.mUnknown, \n'
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            mString: (json['m_string'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value as String)),\n"
        "            mInt: (json['m_int'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, (value as int))),\n"
        "            mNumber: (json['m_number'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, (value as num).toDouble())),\n"
        "            mBoolean: (json['m_boolean'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value as bool)),\n"
        "            mDateTime: (json['m_date_time'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, DateTime.parse(value as String))),\n"
        "            mUri: (json['m_uri'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, Uri.parse(value as String))),\n"
        "            mMapOfString: (json['m_map_of_string'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, (value as Map<String, dynamic>).map((key, value) => MapEntry(key, value as String)))),\n"
        "            mEnum: (json['m_enum'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, TestMEnum.fromJson(value as String))),\n"
        "            mUnknown: (json['m_unknown'] as Map<String, dynamic>?)?.map((key, value) => MapEntry(key, value)),\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final Map<String, String>? mString;\n'
        'final Map<String, int>? mInt;\n'
        'final Map<String, double>? mNumber;\n'
        'final Map<String, bool>? mBoolean;\n'
        'final Map<String, DateTime>? mDateTime;\n'
        'final Map<String, Uri>? mUri;\n'
        'final Map<String, Map<String, String>>? mMapOfString;\n'
        'final Map<String, TestMEnum>? mEnum;\n'
        'final Map<String, dynamic>? mUnknown;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'm_string': mString,\n"
        "            'm_int': mInt,\n"
        "            'm_number': mNumber,\n"
        "            'm_boolean': mBoolean,\n"
        "            'm_date_time': mDateTime?.map((key, value) => MapEntry(key, value.toIso8601String())),\n"
        "            'm_uri': mUri?.map((key, value) => MapEntry(key, value.toString())),\n"
        "            'm_map_of_string': mMapOfString,\n"
        "            'm_enum': mEnum?.map((key, value) => MapEntry(key, value.toJson())),\n"
        "            'm_unknown': mUnknown,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '        Object.hashAll([\n'
        '          mapHash(mString),\n'
        '          mapHash(mInt),\n'
        '          mapHash(mNumber),\n'
        '          mapHash(mBoolean),\n'
        '          mapHash(mDateTime),\n'
        '          mapHash(mUri),\n'
        '          mapHash(mMapOfString),\n'
        '          mapHash(mEnum),\n'
        '          mapHash(mUnknown),\n'
        '        ]);\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && mapsEqual(this.mString, other.mString)\n'
        '            && mapsEqual(this.mInt, other.mInt)\n'
        '            && mapsEqual(this.mNumber, other.mNumber)\n'
        '            && mapsEqual(this.mBoolean, other.mBoolean)\n'
        '            && mapsEqual(this.mDateTime, other.mDateTime)\n'
        '            && mapsEqual(this.mUri, other.mUri)\n'
        '            && mapsEqual(this.mMapOfString, other.mMapOfString)\n'
        '            && mapsEqual(this.mEnum, other.mEnum)\n'
        '            && mapsEqual(this.mUnknown, other.mUnknown)\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    test('array type with pod types', () {
      final schema = {
        'type': 'object',
        'properties': {
          'a_string': {
            'type': 'array',
            'items': {'type': 'string'},
          },
          'a_int': {
            'type': 'array',
            'items': {'type': 'integer'},
          },
          'a_number': {
            'type': 'array',
            'items': {'type': 'number'},
          },
          'a_boolean': {
            'type': 'array',
            'items': {'type': 'boolean'},
          },
          'a_date_time': {
            'type': 'array',
            'items': {'type': 'string', 'format': 'date-time'},
          },
          'a_uri': {
            'type': 'array',
            'items': {'type': 'string', 'format': 'uri'},
          },
          'a_array_of_string': {
            'type': 'array',
            'items': {
              'type': 'array',
              'items': {'type': 'string'},
            },
          },
          'a_enum': {
            'type': 'array',
            'items': {
              'type': 'string',
              'enum': ['a', 'b', 'c'],
            },
          },
          'a_unknown': {'type': 'array', 'items': <String, dynamic>{}},
        },
      };
      final result = renderTestSchema(
        schema,
        quirks: const Quirks(allListsDefaultToEmpty: true),
      );
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.aString = const [], this.aInt = const [], this.aNumber = const [], this.aBoolean = const [], this.aDateTime = const [], this.aUri = const [], this.aArrayOfString = const [], this.aEnum = const [], this.aUnknown = const [], \n'
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            aString: (json['a_string'] as List?)?.cast<String>() ?? const [],\n"
        "            aInt: (json['a_int'] as List?)?.cast<int>() ?? const [],\n"
        "            aNumber: (json['a_number'] as List?)?.cast<double>() ?? const [],\n"
        "            aBoolean: (json['a_boolean'] as List?)?.cast<bool>() ?? const [],\n"
        "            aDateTime: (json['a_date_time'] as List?)?.cast<DateTime>() ?? const [],\n"
        "            aUri: (json['a_uri'] as List?)?.cast<Uri>() ?? const [],\n"
        "            aArrayOfString: (json['a_array_of_string'] as List?)?.cast<List<String>>() ?? const [],\n"
        "            aEnum: (json['a_enum'] as List?)?.map<TestAEnumInner>((e) => TestAEnumInner.fromJson(e as String)).toList() ?? const [],\n"
        "            aUnknown: (json['a_unknown'] as List?)?.cast<dynamic>() ?? const [],\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final List<String>? aString;\n'
        'final List<int>? aInt;\n'
        'final List<double>? aNumber;\n'
        'final List<bool>? aBoolean;\n'
        'final List<DateTime>? aDateTime;\n'
        'final List<Uri>? aUri;\n'
        'final List<List<String>>? aArrayOfString;\n'
        'final List<TestAEnumInner>? aEnum;\n'
        'final List<dynamic>? aUnknown;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'a_string': aString,\n"
        "            'a_int': aInt,\n"
        "            'a_number': aNumber,\n"
        "            'a_boolean': aBoolean,\n"
        "            'a_date_time': aDateTime?.map((e) => e.toIso8601String()).toList(),\n"
        "            'a_uri': aUri?.map((e) => e.toString()).toList(),\n"
        "            'a_array_of_string': aArrayOfString,\n"
        "            'a_enum': aEnum?.map((e) => e.toJson()).toList(),\n"
        "            'a_unknown': aUnknown,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '        Object.hashAll([\n'
        '          listHash(aString),\n'
        '          listHash(aInt),\n'
        '          listHash(aNumber),\n'
        '          listHash(aBoolean),\n'
        '          listHash(aDateTime),\n'
        '          listHash(aUri),\n'
        '          listHash(aArrayOfString),\n'
        '          listHash(aEnum),\n'
        '          listHash(aUnknown),\n'
        '        ]);\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && listsEqual(this.aString, other.aString)\n'
        '            && listsEqual(this.aInt, other.aInt)\n'
        '            && listsEqual(this.aNumber, other.aNumber)\n'
        '            && listsEqual(this.aBoolean, other.aBoolean)\n'
        '            && listsEqual(this.aDateTime, other.aDateTime)\n'
        '            && listsEqual(this.aUri, other.aUri)\n'
        '            && listsEqual(this.aArrayOfString, other.aArrayOfString)\n'
        '            && listsEqual(this.aEnum, other.aEnum)\n'
        '            && listsEqual(this.aUnknown, other.aUnknown)\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    test('empty object', () {
      final schema = {'type': 'object', 'properties': <String, dynamic>{}};
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    const Test();\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic> _) {\n'
        '        return const Test();\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    Map<String, dynamic> toJson() => const {};\n'
        '}\n',
      );
    });

    test('empty object as property', () {
      final schema = {
        'type': 'object',
        'properties': {
          'a': {'type': 'object', 'properties': <String, dynamic>{}},
        },
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.a, \n'
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            a: TestA.maybeFromJson(json['a'] as Map<String, dynamic>?),\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final TestA? a;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'a': a?.toJson(),\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          a.hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && this.a == other.a\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    test(
      'empty-object property round-trips through fromJson/toJson',
      () {
        // Regression: nullable EmptyObject properties used to hard-code
        // `const TestA()` on read and `const <String, dynamic>{}` on
        // write, ignoring the actual field. Now they delegate to the
        // generated class's `fromJson`/`toJson` like every other
        // newtype.
        final schema = {
          'type': 'object',
          'properties': {
            'a': {'type': 'object', 'properties': <String, dynamic>{}},
          },
        };
        final result = renderTestSchema(schema);
        expect(
          result,
          contains(
            "a: TestA.maybeFromJson(json['a'] as Map<String, dynamic>?),",
          ),
        );
        expect(result, contains("'a': a?.toJson(),"));
        expect(result, isNot(contains('const TestA()')));
        expect(result, isNot(contains('const <String, dynamic>{}')));
      },
    );

    test(
      'nullable oneOf property casts JSON to nullable Map',
      () {
        // Regression: `RenderOneOf.jsonStorageType` ignored its
        // `isNullable` parameter, so a nullable oneOf property emitted
        // `as Map<String, dynamic>` (non-nullable). Round-tripping a
        // class whose only value for that field was `null` then crashed
        // in `fromJson` with `Null is not a subtype of Map<String,
        // dynamic>`. The cast must be `Map<String, dynamic>?` for
        // nullable property reads.
        final json = {
          'type': 'object',
          'properties': {
            'a': {
              'type': ['string', 'number'],
            },
          },
        };
        expect(
          renderTestSchema(json),
          contains(
            "a: TestA.maybeFromJson(json['a'] as Map<String, dynamic>?),",
          ),
        );
      },
    );

    test(
      'additionalProperties round-trip excludes named property keys',
      () {
        // Regression: the additionalProperties for-loop used to call
        // `json.map(MapEntry.new)` on read and
        // `entries.map(MapEntry.new)` on write, sweeping the named-
        // property JSON keys into the catch-all `entries` field on
        // round-trip. github's `copilot_*` and `webhook_config` round-
        // trips all crashed (or saw structurally-different `entries`
        // on the parsed instance) because of this. The for-loop now
        // filters by a `const <String>{...}` of named-property JSON
        // names.
        final schema = {
          'type': 'object',
          'properties': {
            'a': {'type': 'string'},
            'b': {'type': 'integer'},
          },
          'additionalProperties': {'type': 'string'},
        };
        final result = renderTestSchema(schema);
        expect(result, contains("const {'a', 'b'}.contains(entry.key)"));
        // Keyed `entries` value cast uses the additionalProperties
        // value type (`String` here, not `dynamic`).
        expect(result, contains('entry.value as String'));
        // hashCode uses `mapHash(entries)` so two structurally-equal
        // instances hash the same.
        expect(result, contains('mapHash(entries)'));
      },
    );

    test('additionalProperties operator[] routes named keys to their fields', () {
      // `operator[]` must agree with the object's own key set: a key naming a
      // declared property returns that property (not `null`), and only unknown
      // keys fall through to the `entries` overflow. Previously it read solely
      // from `entries`, so `x['name']` was `null` even though `toJson()`
      // emitted `name`.
      final schema = {
        'type': 'object',
        'properties': {
          'name': {'type': 'string'},
          'count': {'type': 'integer'},
        },
        'additionalProperties': true,
      };
      final result = renderTestSchema(schema);
      // Return type is `Object?` — the tightest type common to the
      // heterogeneously-typed named properties and the overflow. Not
      // `dynamic` (which would opt out of static checking) and not a specific
      // value type (the named fields have no common subtype).
      expect(
        result,
        contains('Object? operator [](String key) => switch (key)'),
      );
      expect(result, contains("'name' => name,"));
      expect(result, contains("'count' => count,"));
      expect(result, contains('_ => entries[key],'));
    });

    test('array with default value', () {
      final schema = {
        'type': 'object',
        'properties': {
          'a': {
            'type': 'array',
            'items': {'type': 'string'},
            'default': ['a', 'b'],
          },
        },
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        "        { this.a = const <String>['a', 'b'], \n"
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            a: (json['a'] as List?)?.cast<String>() ?? const <String>['a', 'b'],\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final List<String>? a;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'a': a,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          listHash(a).hashCode;\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && listsEqual(this.a, other.a)\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    test('enum with invalid characters', () {
      final json = {
        'type': 'string',
        'enum': ['+1', '-1', "don't"],
      };
      final result = renderTestSchema(json);
      expect(
        result,
        'enum Test {\n'
        "    plus1._('+1'),\n"
        "    minus1._('-1'),\n"
        "    dont._('don\\'t'),\n"
        '    ;\n'
        '\n'
        '    const Test._(this.value);\n'
        '\n'
        '    /// Creates a Test from a json value.\n'
        '    factory Test.fromJson(String json) {\n'
        '        return Test.values.firstWhere(\n'
        '            (value) => value.value == json,\n'
        '            orElse: () =>\n'
        "                throw FormatException('Unknown Test value: \$json')\n"
        '        );\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json value.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(String? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    /// The value of the enum.  This is the exact value\n'
        '    /// from the OpenAPI spec and will be used for network transport.\n'
        '    final String value;\n'
        '\n'
        '    /// Converts the enum to its json value.\n'
        '    String toJson() => value;\n'
        '\n'
        '    /// Returns the string form of the enum.\n'
        '    @override\n'
        '    String toString() => value.toString();\n'
        '}\n',
      );
    });

    test('integer enum renders as a Dart enum with int-typed value', () {
      // Discord uses single-value `type: integer, enum: [N]` enums as
      // oneOf discriminator markers (component types). Verify the
      // generated Dart enum stores the value as `int`, the
      // factory/maybeFromJson accept `int`/`int?`, and `toJson()`
      // returns `int`.
      final json = {
        'type': 'integer',
        'enum': [1, 2, 11],
      };
      final result = renderTestSchema(json);
      // Variants get name `value<N>` since int values aren't valid
      // Dart identifiers on their own.
      expect(result, contains('value1._(1)'));
      expect(result, contains('value2._(2)'));
      expect(result, contains('value11._(11)'));
      // JSON wire types are `int`, not `String`.
      expect(result, contains('factory Test.fromJson(int json)'));
      expect(result, contains('static Test? maybeFromJson(int? json)'));
      expect(result, contains('final int value;'));
      expect(result, contains('int toJson() => value;'));
      // No String-typed survivors anywhere in the body.
      expect(result, isNot(contains('final String value;')));
      expect(result, isNot(contains('factory Test.fromJson(String')));
    });

    test('integer enum with negative values uses safe variable names', () {
      final json = {
        'type': 'integer',
        'enum': [-1, 0, 1],
      };
      final result = renderTestSchema(json);
      // Negative values would be invalid Dart identifiers (`value-1`);
      // generator falls back to `valueNeg<abs>`.
      expect(result, contains('valueNeg1._(-1)'));
      expect(result, contains('value0._(0)'));
      expect(result, contains('value1._(1)'));
    });

    test('properties with invalid names', () {
      final json = {
        'type': 'object',
        'properties': {
          'foo-bar': {'type': 'string'},
          '_not_private': {'type': 'string'},
          'bar baz': {'type': 'string'},
          '123': {'type': 'string'},
          '+1': {'type': 'string'},
          '-1': {'type': 'string'},
          "don't": {'type': 'string'},
          'default': {'type': 'string'},
        },
      };
      final result = renderTestSchema(json);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.fooBar, this.notPrivate, this.barBaz, this.n123, this.plus1, this.minus1, this.dont, this.default_, \n'
        '         }\n'
        '    );\n'
        '\n'
        '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        "        return parseFromJson('Test', json, () => Test(\n"
        "            fooBar: json['foo-bar'] as String?,\n"
        "            notPrivate: json['_not_private'] as String?,\n"
        "            barBaz: json['bar baz'] as String?,\n"
        "            n123: json['123'] as String?,\n"
        "            plus1: json['+1'] as String?,\n"
        "            minus1: json['-1'] as String?,\n"
        "            dont: json['don't'] as String?,\n"
        "            default_: json['default'] as String?,\n"
        '        ));\n'
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    final String? fooBar;\n'
        'final String? notPrivate;\n'
        'final String? barBaz;\n'
        'final String? n123;\n'
        'final String? plus1;\n'
        'final String? minus1;\n'
        'final String? dont;\n'
        'final String? default_;\n'
        '\n'
        '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'foo-bar': fooBar,\n"
        "            '_not_private': notPrivate,\n"
        "            'bar baz': barBaz,\n"
        "            '123': n123,\n"
        "            '+1': plus1,\n"
        "            '-1': minus1,\n"
        "            'don\\'t': dont,\n"
        "            'default': default_,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '        Object.hashAll([\n'
        '          fooBar,\n'
        '          notPrivate,\n'
        '          barBaz,\n'
        '          n123,\n'
        '          plus1,\n'
        '          minus1,\n'
        '          dont,\n'
        '          default_,\n'
        '        ]);\n'
        '\n'
        '    @override\n'
        '    bool operator ==(Object other) {\n'
        '        if (identical(this, other)) return true;\n'
        '        return other is Test\n'
        '            && this.fooBar == other.fooBar\n'
        '            && this.notPrivate == other.notPrivate\n'
        '            && this.barBaz == other.barBaz\n'
        '            && this.n123 == other.n123\n'
        '            && this.plus1 == other.plus1\n'
        '            && this.minus1 == other.minus1\n'
        '            && this.dont == other.dont\n'
        '            && this.default_ == other.default_\n'
        '        ;\n'
        '    }\n'
        '}\n',
      );
    });

    group('number validations', () {
      test('integer non-named', () {
        final json = {
          'type': 'integer',
          'minimum': 1,
          'maximum': 10,
          'multipleOf': 2,
          'exclusiveMinimum': 9,
          'exclusiveMaximum': 0,
        };
        // validation does not force a new type.  We tried it, it was ugly.
        expect(() => renderTestSchema(json), throwsA(isA<StateError>()));
      });

      test('integer named', () {
        final json = {
          'type': 'integer',
          'minimum': 1,
          'maximum': 10,
          'multipleOf': 2,
          // It doesn't make sense to have both exclusive and inclusive
          // validations, but we support it anyway.
          'exclusiveMinimum': 9,
          'exclusiveMaximum': 0,
        };
        // Named schemas get their own newtype and validate each rule
        // in the constructor body via a `value` cascade. `dart format`
        // re-indents this cleanly in the user-visible regen.
        expect(
          renderTestSchema(json, asComponent: true),
          'extension type const Test._(int value) {\n'
          '    Test(this.value) {\n'
          '        value\n'
          '      ..validateMaximum(10)\n'
          '      ..validateMinimum(1)\n'
          '      ..validateExclusiveMaximum(0)\n'
          '      ..validateExclusiveMinimum(9)\n'
          '      ..validateMultipleOf(2);\n'
          '    }\n'
          '\n'
          '    factory Test.fromJson(int json) => Test(json);\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(int? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    int toJson() => value;\n'
          '}\n',
        );
      });

      test('number non-named', () {
        final json = {
          'type': 'number',
          'minimum': 1.2,
          'maximum': 10.2,
          'multipleOf': 2.2,
          // It doesn't make sense to have both exclusive and inclusive
          // validations, but we support it anyway.
          'exclusiveMinimum': 9,
          'exclusiveMaximum': 0,
        };
        // validation does not force a new type.  We tried it, it was ugly.
        expect(() => renderTestSchema(json), throwsA(isA<StateError>()));
      });

      test('number named', () {
        final json = {
          'type': 'number',
          'minimum': 1.2,
          'maximum': 10.2,
          'multipleOf': 2.2,
        };
        expect(
          renderTestSchema(json, asComponent: true),
          'extension type const Test._(double value) {\n'
          '    Test(this.value) {\n'
          '        value\n'
          '      ..validateMaximum(10.2)\n'
          '      ..validateMinimum(1.2)\n'
          '      ..validateMultipleOf(2.2);\n'
          '    }\n'
          '\n'
          '    factory Test.fromJson(num json) => Test(json.toDouble());\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(num? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    double toJson() => value;\n'
          '}\n',
        );
      });

      test('named number with default values', () {
        final json = {'type': 'number', 'default': 1.2, 'maximum': 10.2};
        expect(
          renderTestSchema(json, asComponent: true),
          'extension type const Test._(double value) {\n'
          '    Test(this.value) {\n'
          '        value.validateMaximum(10.2);\n'
          '    }\n'
          '\n'
          '    factory Test.fromJson(num json) => Test(json.toDouble());\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(num? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    double toJson() => value;\n'
          '}\n',
        );
      });
      test('number property with default values', () {
        final json = {
          'type': 'object',
          'properties': {
            'a': {'type': 'number', 'default': 1.2, 'maximum': 10.2},
          },
        };
        final result = renderTestSchema(json);
        expect(
          result,
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { this.a = 1.2, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            a: (json['a'] as num?)?.toDouble() ?? 1.2,\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final double? a;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'a': a,\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          a.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.a == other.a\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });

      test('named integer with default values', () {
        final json = {'type': 'integer', 'default': 1, 'minimum': 0};
        expect(
          renderTestSchema(json, asComponent: true),
          'extension type const Test._(int value) {\n'
          '    Test(this.value) {\n'
          '        value.validateMinimum(0);\n'
          '    }\n'
          '\n'
          '    factory Test.fromJson(int json) => Test(json);\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(int? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    int toJson() => value;\n'
          '}\n',
        );
      });

      test(
        'optional property with const default under openapi quirks emits '
        '?? default in fromJson and non-nullable field',
        () {
          // Covers the `!dartIsNullable` arm of `orDefaultExpression`:
          // `nonNullableDefaultValues` makes the Dart field non-null
          // when a default is present, and `as int? ?? 1` is what
          // populates the field on a missing JSON key. Mirrors github's
          // `repository.private = false` shape.
          final json = {
            'type': 'object',
            'properties': {
              'count': {'type': 'integer', 'default': 1},
            },
          };
          final result = renderTestSchema(
            json,
            quirks: const Quirks.openapi(),
          );
          expect(result, contains('int count;'));
          expect(result, contains("count: (json['count'] as int?) ?? 1,"));
        },
      );

      test(
        'reference to a number-newtype WITH a default emits T(value) at '
        'the substitution site',
        () {
          // Counterpart to the no-default test below. Locks in the
          // `createsNewType && defaultValue != null` branch of
          // `RenderNumeric.defaultValueString` — and confirms the
          // newtype-wrapped substitution is what callers actually get
          // when the spec ships a default on a number newtype under
          // the openapi quirks (where the property becomes non-null).
          final results = renderTestSchemas(
            {
              'WaitTimer': {'type': 'integer', 'default': 30},
              'Rule': {
                'type': 'object',
                'properties': {
                  'wait_timer': {r'$ref': '#/components/schemas/WaitTimer'},
                },
              },
            },
            specUrl: Uri.parse('file:///spec.yaml'),
            quirks: const Quirks.openapi(),
          );
          final rule = results['Rule']!;
          expect(rule, contains('?? WaitTimer(30)'));
          expect(rule, isNot(contains('WaitTimer(null)')));
        },
      );

      test(
        'optional reference to a number-newtype with no default does '
        'not emit T(null)',
        () {
          // Regression for github's `WaitTimer` referenced from
          // `environment_protection_rule.wait_timer`. WaitTimer is a
          // number newtype (`type: integer` with its own component name)
          // and has no `default:`. Under openapi quirks, a non-required
          // property whose schema is const-constructible would trigger
          // `orDefaultExpression` to call `defaultValueString` — which
          // for a number-newtype was emitting `WaitTimer(null)` even
          // though the underlying `defaultValue` was null. That made
          // the generated `?? const WaitTimer(null)` fail to compile
          // (Null can't fit a non-null int parameter).
          final results = renderTestSchemas(
            {
              'WaitTimer': {'type': 'integer'},
              'Rule': {
                'type': 'object',
                'properties': {
                  'wait_timer': {r'$ref': '#/components/schemas/WaitTimer'},
                },
              },
            },
            specUrl: Uri.parse('file:///spec.yaml'),
            quirks: const Quirks.openapi(),
          );
          final rule = results['Rule']!;
          expect(rule, isNot(contains('WaitTimer(null)')));
        },
      );

      test('integer property with default values', () {
        final json = {
          'type': 'object',
          'properties': {
            'a': {'type': 'integer', 'default': 1, 'minimum': 0},
          },
        };
        final result = renderTestSchema(json);
        expect(
          result,
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { this.a = 1, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            a: (json['a'] as int?) ?? 1,\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final int? a;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'a': a,\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          a.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.a == other.a\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });

    group('doc comments', () {
      test('string newtype', () {
        final json = {
          'type': 'string',
          'title': 'Title',
          'description': 'Description',
          'example': 'example',
          'examples': ['example1', 'example2'],
        };
        expect(
          renderTestSchema(json, asComponent: true),
          '/// Title\n'
          '/// Description\n'
          "/// Example: `'example'`\n"
          "/// Example: `'example1'`\n"
          "/// Example: `'example2'`\n"
          'extension type const Test._(String value) {\n'
          '    const Test(this.value);\n'
          '\n'
          '    factory Test.fromJson(String json) => Test(json);\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(String? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    String toJson() => value;\n'
          '}\n',
        );
      });
      test('bool newtype suppresses positional-bool lint', () {
        // The generated extension-type, fromJson, and maybeFromJson all
        // take a positional `bool`, which trips
        // `avoid_positional_boolean_parameters`. The lint is correct
        // for user-facing APIs but wrong for a newtype wrapper — the
        // type name is the disambiguation. Suppress file-locally.
        // See github's `prevent_self_review` in api.github.com.json.
        final json = {'type': 'boolean'};
        expect(
          renderTestSchema(json, asComponent: true),
          '// `avoid_positional_boolean_parameters` is correct for user-facing\n'
          '// APIs but wrong for a newtype wrapper — the type name is the\n'
          '// disambiguation. Suppress file-locally.\n'
          '// ignore_for_file: avoid_positional_boolean_parameters\n'
          '\n'
          'extension type const Test._(bool value) {\n'
          '    const Test(this.value);\n'
          '\n'
          '    factory Test.fromJson(bool json) => Test(json);\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(bool? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    bool toJson() => value;\n'
          '}\n',
        );
      });
      test('number newtype', () {
        final json = {
          'type': 'number',
          'title': 'Title',
          'description': 'Description',
          'example': 1.2,
          'examples': [1.2, 1.3],
        };
        expect(
          renderTestSchema(json, asComponent: true),
          '/// Title\n'
          '/// Description\n'
          '/// Example: `1.2`\n'
          '/// Example: `1.2`\n'
          '/// Example: `1.3`\n'
          'extension type const Test._(double value) {\n'
          '    const Test(this.value);\n'
          '\n'
          '    factory Test.fromJson(num json) => Test(json.toDouble());\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(num? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    double toJson() => value;\n'
          '}\n',
        );
      });
      test('object', () {
        final json = {
          'type': 'object',
          'title': 'Title',
          'description': 'Description',
          'properties': {
            'a': {'type': 'string'},
            'b': {'type': 'string'},
          },
          'example': {'a': 'example', 'b': 'example'},
          'examples': [
            {'a': 'example1', 'b': 'example1'},
            {'a': 'example2', 'b': 'example2'},
          ],
        };
        expect(
          renderTestSchema(json, asComponent: true),
          '/// {@template test}\n'
          '/// Title\n'
          '/// Description\n'
          '/// {@endtemplate}\n'
          '/// Example:\n'
          '/// ```json\n'
          '/// {\n'
          '///   "a": "example",\n'
          '///   "b": "example"\n'
          '/// }\n'
          '/// ```\n'
          '/// Example:\n'
          '/// ```json\n'
          '/// {\n'
          '///   "a": "example1",\n'
          '///   "b": "example1"\n'
          '/// }\n'
          '/// ```\n'
          '/// Example:\n'
          '/// ```json\n'
          '/// {\n'
          '///   "a": "example2",\n'
          '///   "b": "example2"\n'
          '/// }\n'
          '/// ```\n'
          '@immutable\n'
          'class Test {\n'
          '    /// {@macro test}\n'
          '    Test(\n'
          '        { this.a, this.b, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            a: json['a'] as String?,\n"
          "            b: json['b'] as String?,\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final String? a;\n'
          'final String? b;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'a': a,\n"
          "            'b': b,\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '        Object.hashAll([\n'
          '          a,\n'
          '          b,\n'
          '        ]);\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.a == other.a\n'
          '            && this.b == other.b\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });

    group('deprecated', () {
      test('string', () {
        final json = {
          'type': 'object',
          'properties': {
            'a': {'type': 'string', 'deprecated': true},
          },
        };
        final result = renderTestSchema(json, asComponent: true);
        expect(
          result,
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { @deprecated this.a, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            a: json['a'] as String?,\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    @deprecated\n'
          '    final String? a;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'a': a,\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          a.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.a == other.a\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });
    group('nullable', () {
      // Test nullable when required and not.
      // type=['string', 'null'] vs. nullable=true are tested by the parser.
      test('string', () {
        final json = {
          'type': 'object',
          'properties': {
            'req_null': {'type': 'string', 'nullable': true},
            'opt_null': {'type': 'string', 'nullable': true},
            'req': {'type': 'string'},
            'opt': {'type': 'string'},
          },
          'required': ['req_null', 'req'],
        };
        expect(
          renderTestSchema(json, asComponent: true),
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { required this.reqNull, this.optNull, required this.req, this.opt, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            reqNull: checkedKey(json, 'req_null') as String?,\n"
          "            optNull: json['opt_null'] as String?,\n"
          "            req: json['req'] as String,\n"
          "            opt: json['opt'] as String?,\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final String? reqNull;\n'
          'final String? optNull;\n'
          'final String req;\n'
          'final String? opt;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'req_null': reqNull,\n"
          "            'opt_null': optNull,\n"
          "            'req': req,\n"
          "            'opt': opt,\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '        Object.hashAll([\n'
          '          reqNull,\n'
          '          optNull,\n'
          '          req,\n'
          '          opt,\n'
          '        ]);\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.reqNull == other.reqNull\n'
          '            && this.optNull == other.optNull\n'
          '            && this.req == other.req\n'
          '            && this.opt == other.opt\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });
    group('multiple types', () {
      test('string or number', () {
        final json = {
          'type': ['string', 'number'],
        };
        // `type: [string, number]` resolves into a oneOf, which now
        // shape-dispatches now that RenderNumber has a shape key.
        final result = renderTestSchema(json, asComponent: true);
        expect(result, contains('String v => TestString(v)'));
        expect(result, contains('num v => TestNum(v)'));
        expect(result, isNot(contains('throw UnimplementedError')));
      });
      test('string or number as property', () {
        final json = {
          'type': 'object',
          'properties': {
            'a': {
              'type': ['string', 'number'],
            },
          },
        };
        // TODO(eseidel): Use dynamic instead of TestAProp.
        expect(
          renderTestSchema(json),
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { this.a, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    /// Converts a `Map<String, dynamic>` to a [Test].\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          "        return parseFromJson('Test', json, () => Test(\n"
          "            a: TestA.maybeFromJson(json['a'] as Map<String, dynamic>?),\n"
          '        ));\n'
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(Map<String, dynamic>? json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    final TestA? a;\n'
          '\n'
          '    /// Converts a [Test] to a `Map<String, dynamic>`.\n'
          '    Map<String, dynamic> toJson() {\n'
          '        return {\n'
          "            'a': a?.toJson(),\n"
          '        };\n'
          '    }\n'
          '\n'
          '    @override\n'
          '    int get hashCode =>\n'
          '          a.hashCode;\n'
          '\n'
          '    @override\n'
          '    bool operator ==(Object other) {\n'
          '        if (identical(this, other)) return true;\n'
          '        return other is Test\n'
          '            && this.a == other.a\n'
          '        ;\n'
          '    }\n'
          '}\n',
        );
      });
    });
  });

  group('string validations', () {
    test('maxLength and minLength validate in named string constructor', () {
      final json = {
        'type': 'string',
        'default': 'foo',
        'maxLength': 10,
        'minLength': 1,
      };
      // Length validations move into the constructor body so the
      // newtype enforces them once at construction. Multiple calls
      // emit as a `value` cascade chain to satisfy the
      // `cascade_invocations` lint.
      expect(
        renderTestSchema(json, asComponent: true),
        'extension type const Test._(String value) {\n'
        '    Test(this.value) {\n'
        '        value\n'
        '      ..validateMaximumLength(10)\n'
        '      ..validateMinimumLength(1);\n'
        '    }\n'
        '\n'
        '    factory Test.fromJson(String json) => Test(json);\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(String? json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    String toJson() => value;\n'
        '}\n',
      );
    });

    group('array parameters', () {
      test(
        'nullable string-array query param emits .map((e) => e.toString()).toList()',
        () {
          // Default OpenAPI style=form, explode=true: each value gets its own
          // ?key=v repetition. Generated client emits an Iterable<String>
          // and `Uri.replace` handles the spreading.
          final operation = {
            'parameters': [
              {
                'name': 'tags',
                'in': 'query',
                'schema': {
                  'type': 'array',
                  'items': {'type': 'string'},
                },
              },
            ],
            'responses': {
              '200': {'description': 'OK'},
            },
          };
          final result = renderTestOperation(
            path: '/items',
            operationJson: operation,
            serverUrl: Uri.parse('https://example.com'),
          );
          expect(
            result,
            contains(
              "                if (tags != null) 'tags': tags.map((e) => e.toString()).toList(),",
            ),
          );
          // The buggy old emission must be gone — `?tags?.toString()` would
          // ship the list as `[a, b]` literal on the wire.
          expect(result, isNot(contains('?tags?.toString()')));
        },
      );

      test('array header param joins items with comma', () {
        // Default style=simple, explode=false for headers: HTTP headers
        // can't repeat with arbitrary semantics, so values are CSV-joined
        // into a single string.
        final operation = {
          'parameters': [
            {
              'name': 'X-Tags',
              'in': 'header',
              'required': true,
              'schema': {
                'type': 'array',
                'items': {'type': 'string'},
              },
            },
          ],
          'responses': {
            '200': {'description': 'OK'},
          },
        };
        final result = renderTestOperation(
          path: '/items',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        );
        expect(
          result,
          contains(
            "                'X-Tags': xTags.map((e) => e.toString()).join(','),",
          ),
        );
      });
    });

    group('array validations', () {
      test('operation', () {
        final operation = {
          'tags': ['pet'],
          'summary': 'Uploads an image.',
          'operationId': 'uploadPets',
          'parameters': [
            {
              'name': 'ids',
              'in': 'query',
              'description': 'IDs of pets to update',
              'required': true,
              'schema': {
                'type': 'array',
                'items': {'type': 'integer'},
                'maxItems': 10,
                'minItems': 1,
                'uniqueItems': true,
              },
            },
          ],
          'responses': {
            '200': {'description': 'successful operation'},
          },
        };
        final result = renderTestOperation(
          path: '/pet/{petId}/uploadImage',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        );
        expect(
          result,
          '/// Test API\n'
          'class PetApi {\n'
          '    PetApi(ApiClient? client) : client = client ?? ApiClient();\n'
          '\n'
          '    final ApiClient client;\n'
          '\n'
          '    /// Uploads an image.\n'
          '    Future<void> uploadPets(\n'
          '        List<int> ids,\n'
          '    ) async {\n'
          '        ids\n'
          '      ..validateMaximumItems(10)\n'
          '      ..validateMinimumItems(1)\n'
          '      ..validateUniqueItems();\n'
          '\n'
          '        final response = await client.invokeApi(\n'
          '            method: Method.post,\n'
          "            path: '/pet/{petId}/uploadImage',\n"
          '            queryParameters: {\n'
          "                'ids': ids.map((e) => e.toString()).toList(),\n"
          '            },\n'
          '        );\n'
          '\n'
          '        if (response.statusCode >= HttpStatus.badRequest) {\n'
          '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
          '        }\n'
          '    }\n'
          '}\n',
        );
      });
    });

    test('renderSchema throws for non-new-type schemas', () {
      final json = {'type': 'string'};
      expect(() => renderTestSchema(json), throwsA(isA<StateError>()));
    });

    // We used to force a new type for string validations, but it was ugly.
    // renderSchema throws for for non-new-type schemas.  If we ever remove
    // that throw, we should test the underlying RenderSchema instead.
    test('string validations do not force a new type', () {
      final json = {
        'type': 'string',
        'default': 'foo',
        'maxLength': 10,
        'minLength': 1,
        'pattern': r'^[a-z]+$',
      };
      expect(() => renderTestSchema(json), throwsA(isA<StateError>()));
    });
  });

  group('renderTestApiFromSpec', () {
    test('defined tag', () {
      final spec = {
        'openapi': '3.0.0',
        'info': {'title': 'Test', 'version': '1.0.0'},
        'servers': [
          {'url': 'https://api.spacetraders.io/v2'},
        ],
        'tags': [
          {'name': 'tag1', 'description': 'Tag 1 Description'},
          {'name': 'tag2', 'description': 'Tag 2 Description'},
        ],
        'paths': {
          '/users': {
            'get': {
              'tags': ['tag1'],
              'summary': 'Get user',
              'description': 'Get user',
              'responses': {
                '200': {'description': 'OK'},
              },
            },
          },
        },
      };
      final specUrl = Uri.parse('file:///spec.yaml');
      final result = renderTestApiFromSpec(
        specJson: spec,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
        specUrl: specUrl,
      );
      expect(
        result,
        '/// Tag 1 Description\n'
        'class Tag1Api {\n'
        '    Tag1Api(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.get,\n'
        "            path: '/users',\n"
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException<Object?>(response.statusCode, response.body.toString());\n'
        '        }\n'
        '    }\n'
        '}\n',
      );
    });

    test(
      'multi-status sealed wrapper does not collide with a same-named '
      'top-level schema',
      () {
        // Discord regression: a top-level component schema named e.g.
        // `ThreadSearchResponse` is the body of an operation's 200
        // response, and the operation also has a 202 with a different
        // body — multi-status dispatch synthesizes a sealed wrapper
        // class. If that wrapper is also named `ThreadSearchResponse`,
        // the wrapper shadows the imported top-level schema in the
        // api file (so `ThreadSearchResponse.fromJson(...)` fails to
        // resolve) and `lib/api.dart` re-exports the same name from
        // two libraries (`ambiguous_export`).
        //
        // The naming pass must claim the synthesized wrapper's name
        // distinctly from any colliding top-level schema, and the
        // renderer must read the assigned name back from it (rather
        // than recompute `<op>Response`).
        final spec = {
          'openapi': '3.0.0',
          'info': {'title': 'Test', 'version': '1.0.0'},
          'servers': [
            {'url': 'https://api.example.com'},
          ],
          'paths': {
            '/things/search': {
              'get': {
                'operationId': 'thingSearch',
                'responses': {
                  '200': {
                    'description': 'OK',
                    'content': {
                      'application/json': {
                        'schema': {
                          r'$ref': '#/components/schemas/ThingSearchResponse',
                        },
                      },
                    },
                  },
                  '202': {
                    'description': 'Pending',
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
          'components': {
            'schemas': {
              'ThingSearchResponse': {
                'type': 'object',
                'properties': {
                  'total': {'type': 'integer'},
                },
              },
            },
          },
        };
        final result = renderTestApiFromSpec(
          specJson: spec,
          serverUrl: Uri.parse('https://api.example.com'),
          specUrl: Uri.parse('file:///spec.yaml'),
        );
        // The synthesized sealed wrapper must not reuse the top-level
        // schema's name. It picks up a `_2` suffix from the allocator.
        expect(result, contains('sealed class ThingSearchResponse2'));
        expect(result, contains('class ThingSearchResponse2200'));
        expect(result, contains('class ThingSearchResponse2202'));
        // The 200 wrapper's `value` is the top-level schema (the
        // un-suffixed `ThingSearchResponse`), not the local sealed
        // class. If the names collided, the local class would shadow
        // the imported one and the field would loop back into itself.
        expect(result, contains('final ThingSearchResponse value;'));
        // The synchronous return type and switch-arm fromJson call
        // also point at the assigned wrapper name.
        expect(result, contains('Future<ThingSearchResponse2>'));
        expect(result, contains('ThingSearchResponse.fromJson('));
      },
    );
  });
}
