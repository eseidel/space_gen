// We don't have a good way to shorten the literal strings from the
// expected generated code, so ignoring 80c for now.
// ignore_for_file: lines_longer_than_80_chars
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: json['foo'],\n"
        '        );\n'
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
    test('with datetime', () {
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: maybeParseDateTime(json['foo'] as String?),\n"
        '        );\n'
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

    test('with uri', () {
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: maybeParseUri(json['foo'] as String?),\n"
        '        );\n'
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

    test('uri non-nullable', () {
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: Uri.parse(json['foo'] as String),\n"
        '        );\n'
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            foo: json['foo'] as String?,\n"
        "            bar: (json['bar'] as num?)?.toDouble(),\n"
        '        );\n'
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

    test('oneOf with pods', () {
      final schema = {
        'oneOf': [
          {'type': 'string'},
          {'type': 'number'},
        ],
      };
      final result = renderTestSchema(schema);
      expect(
        result,
        'sealed class Test {\n'
        '    static Test fromJson(dynamic jsonArg) {\n'
        '        // Determine which schema to use based on the json.\n'
        '        // TODO(eseidel): Implement this.\n'
        "        throw UnimplementedError('Test.fromJson');\n"
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(dynamic json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    /// Require all subclasses to implement toJson.\n'
        '    dynamic toJson();\n'
        '}\n',
      );
    });

    test('oneOf with objects', () {
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
      expect(
        result,
        'sealed class Test {\n'
        '    static Test fromJson(dynamic jsonArg) {\n'
        '        // Determine which schema to use based on the json.\n'
        '        // TODO(eseidel): Implement this.\n'
        "        throw UnimplementedError('Test.fromJson');\n"
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(dynamic json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    /// Require all subclasses to implement toJson.\n'
        '    dynamic toJson();\n'
        '}\n',
      );
    });

    test('anyOf', () {
      final schema = {
        'anyOf': [
          {'type': 'string'},
          {'type': 'number'},
        ],
      };
      final result = renderTestSchema(schema);
      // anyOf currently renders as a oneOf, which is wrong.
      expect(
        result,
        'sealed class Test {\n'
        '    static Test fromJson(dynamic jsonArg) {\n'
        '        // Determine which schema to use based on the json.\n'
        '        // TODO(eseidel): Implement this.\n'
        "        throw UnimplementedError('Test.fromJson');\n"
        '    }\n'
        '\n'
        '    /// Convenience to create a nullable type from a nullable json object.\n'
        '    /// Useful when parsing optional fields.\n'
        '    static Test? maybeFromJson(dynamic json) {\n'
        '        if (json == null) {\n'
        '            return null;\n'
        '        }\n'
        '        return Test.fromJson(json);\n'
        '    }\n'
        '\n'
        '    /// Require all subclasses to implement toJson.\n'
        '    dynamic toJson();\n'
        '}\n',
      );
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            map: (json['map'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, value as String)),\n"
        '        );\n'
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
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'map': map,\n"
        '        };\n'
        '    }\n'
        '\n'
        '    @override\n'
        '    int get hashCode =>\n'
        '          map.hashCode;\n'
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            mString: (json['m_string'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, value as String)),\n"
        "            mInt: (json['m_int'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, (value as int))),\n"
        "            mNumber: (json['m_number'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, (value as num).toDouble())),\n"
        "            mBoolean: (json['m_boolean'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, value as bool)),\n"
        "            mDateTime: (json['m_date_time'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, DateTime.parse(value as String))),\n"
        "            mUri: (json['m_uri'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, Uri.parse(value as String))),\n"
        "            mMapOfString: (json['m_map_of_string'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, (value as Map<String, dynamic>)?.map((key, value) => MapEntry(key, value as String)))),\n"
        "            mEnum: (json['m_enum'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, TestMEnumProp.fromJson(value as String))),\n"
        "            mUnknown: (json['m_unknown'] as Map<String, dynamic>)?.map((key, value) => MapEntry(key, value)),\n"
        '        );\n'
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
        'final Map<String, TestMEnumProp>? mEnum;\n'
        'final Map<String, dynamic>? mUnknown;\n'
        '\n'
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
        '          mString,\n'
        '          mInt,\n'
        '          mNumber,\n'
        '          mBoolean,\n'
        '          mDateTime,\n'
        '          mUri,\n'
        '          mMapOfString,\n'
        '          mEnum,\n'
        '          mUnknown,\n'
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
      final result = renderTestSchema(schema);
      expect(
        result,
        '@immutable\n'
        'class Test {\n'
        '    Test(\n'
        '        { this.aString = const [], this.aInt = const [], this.aNumber = const [], this.aBoolean = const [], this.aDateTime = const [], this.aUri = const [], this.aArrayOfString = const [], this.aEnum = const [], this.aUnknown = const [], \n'
        '         }\n'
        '    );\n'
        '\n'
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            aString: (json['a_string'] as List?)?.cast<String>(),\n"
        "            aInt: (json['a_int'] as List?)?.cast<int>(),\n"
        "            aNumber: (json['a_number'] as List?)?.cast<double>(),\n"
        "            aBoolean: (json['a_boolean'] as List?)?.cast<bool>(),\n"
        "            aDateTime: (json['a_date_time'] as List?)?.cast<DateTime>(),\n"
        "            aUri: (json['a_uri'] as List?)?.cast<Uri>(),\n"
        "            aArrayOfString: (json['a_array_of_string'] as List?)?.cast<List<String>>(),\n"
        "            aEnum: (json['a_enum'] as List?)?.map<TestAEnumPropInner>((e) => TestAEnumPropInner.fromJson(e as String)).toList(),\n"
        "            aUnknown: (json['a_unknown'] as List?)?.cast<dynamic>(),\n"
        '        );\n'
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
        'final List<TestAEnumPropInner>? aEnum;\n'
        'final List<dynamic>? aUnknown;\n'
        '\n'
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
        '          aString,\n'
        '          aInt,\n'
        '          aNumber,\n'
        '          aBoolean,\n'
        '          aDateTime,\n'
        '          aUri,\n'
        '          aArrayOfString,\n'
        '          aEnum,\n'
        '          aUnknown,\n'
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        '            a: const TestAProp(),\n'
        '        );\n'
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
        '    final TestAProp? a;\n'
        '\n'
        '    Map<String, dynamic> toJson() {\n'
        '        return {\n'
        "            'a': const <String, dynamic>{},\n"
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            a: (json['a'] as List?)?.cast<String>(),\n"
        '        );\n'
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
        '    /// Creates a Test from a json string.\n'
        '    factory Test.fromJson(String json) {\n'
        '        return Test.values.firstWhere(\n'
        '            (value) => value.value == json,\n'
        '            orElse: () =>\n'
        "                throw FormatException('Unknown Test value: \$json')\n"
        '        );\n'
        '    }\n'
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
        '    /// The value of the enum, as a string.  This is the exact value\n'
        '    /// from the OpenAPI spec and will be used for network transport.\n'
        '    final String value;\n'
        '\n'
        '    /// Converts the enum to a json string.\n'
        '    String toJson() => value;\n'
        '\n'
        '    /// Returns the string value of the enum.\n'
        '    @override\n'
        '    String toString() => value;\n'
        '}\n',
      );
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
        '    factory Test.fromJson(Map<String, dynamic>\n'
        '        json) {\n'
        '        return Test(\n'
        "            fooBar: json['foo-bar'] as String?,\n"
        "            notPrivate: json['_not_private'] as String?,\n"
        "            barBaz: json['bar baz'] as String?,\n"
        "            n123: json['123'] as String?,\n"
        "            plus1: json['+1'] as String?,\n"
        "            minus1: json['-1'] as String?,\n"
        "            dont: json['don't'] as String?,\n"
        "            default_: json['default'] as String?,\n"
        '        );\n'
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
        // named schemas get their own class and thus include validations.
        expect(
          renderTestSchema(json, asComponent: true),
          'extension type const Test._(int value) {\n'
          '    const Test(this.value);\n'
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

      test('named number with default values', () {
        final json = {'type': 'number', 'default': 1.2, 'maximum': 10.2};
        expect(
          renderTestSchema(json, asComponent: true),
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
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          '        return Test(\n'
          "            a: (json['a'] as num?)?.toDouble(),\n"
          '        );\n'
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
          '    const Test(this.value);\n'
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
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          '        return Test(\n'
          "            a: (json['a'] as int?),\n"
          '        );\n'
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
        };
        expect(
          renderTestSchema(json, asComponent: true),
          '/// Title\n'
          '/// Description\n'
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
      test('number newtype', () {
        final json = {
          'type': 'number',
          'title': 'Title',
          'description': 'Description',
        };
        expect(
          renderTestSchema(json, asComponent: true),
          '/// Title\n'
          '/// Description\n'
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
        };
        expect(
          renderTestSchema(json, asComponent: true),
          '/// Title\n'
          '/// Description\n'
          '@immutable\n'
          'class Test {\n'
          '    Test(\n'
          '        { this.a, this.b, \n'
          '         }\n'
          '    );\n'
          '\n'
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          '        return Test(\n'
          "            a: json['a'] as String?,\n"
          "            b: json['b'] as String?,\n"
          '        );\n'
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
          '}\n'
          '',
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
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          '        return Test(\n'
          "            a: json['a'] as String?,\n"
          '        );\n'
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
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          '        return Test(\n'
          "            reqNull: json['req_null'] as String?,\n"
          "            optNull: json['opt_null'] as String?,\n"
          "            req: json['req'] as String,\n"
          "            opt: json['opt'] as String?,\n"
          '        );\n'
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
        expect(
          renderTestSchema(json, asComponent: true),
          'sealed class Test {\n'
          '    static Test fromJson(dynamic jsonArg) {\n'
          '        // Determine which schema to use based on the json.\n'
          '        // TODO(eseidel): Implement this.\n'
          "        throw UnimplementedError('Test.fromJson');\n"
          '    }\n'
          '\n'
          '    /// Convenience to create a nullable type from a nullable json object.\n'
          '    /// Useful when parsing optional fields.\n'
          '    static Test? maybeFromJson(dynamic json) {\n'
          '        if (json == null) {\n'
          '            return null;\n'
          '        }\n'
          '        return Test.fromJson(json);\n'
          '    }\n'
          '\n'
          '    /// Require all subclasses to implement toJson.\n'
          '    dynamic toJson();\n'
          '}\n',
        );
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
          '    factory Test.fromJson(Map<String, dynamic>\n'
          '        json) {\n'
          '        return Test(\n'
          "            a: TestAProp.maybeFromJson(json['a'] as Map<String, dynamic>),\n"
          '        );\n'
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
          '    final TestAProp? a;\n'
          '\n'
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
    test('maxLength and minLength can be const in named string', () {
      final json = {
        'type': 'string',
        'default': 'foo',
        'maxLength': 10,
        'minLength': 1,
      };
      expect(
        renderTestSchema(json, asComponent: true),
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

  group('renderOperation', () {
    test('application/octet-stream', () {
      final operation = {
        'tags': ['pet'],
        'summary': 'Uploads an image.',
        'operationId': 'uploadFile',
        'parameters': [
          {
            'name': 'petId',
            'in': 'path',
            'description': 'ID of pet to update',
            'required': true,
            'schema': {'type': 'integer', 'format': 'int64'},
          },
        ],
        'requestBody': {
          'content': {
            'application/octet-stream': {
              'schema': {'type': 'string', 'format': 'binary'},
            },
          },
        },
        'responses': {
          '200': {'description': 'successful operation'},
        },
      };
      final logger = _MockLogger();
      final result = runWithLogger(
        logger,
        () => renderTestOperation(
          path: '/pet/{petId}/uploadImage',
          operationJson: operation,
          serverUrl: Uri.parse('https://example.com'),
        ),
      );
      verify(
        () => logger.detail(
          'Ignoring: format=int64 (String) in #/parameters/0/schema',
        ),
      ).called(1);
      expect(
        result,
        '/// Test API\n'
        'class PetApi {\n'
        '    PetApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Uploads an image.\n'
        '    Future<void> uploadFile(\n'
        '        int petId,\n'
        '        { Uint8List? uint8List, }\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/pet/{petId}/uploadImage'\n"
        '            .replaceAll(\'{petId}\', "\${ petId }")\n'
        '            ,\n'
        '            body: uint8List,\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$uploadFile');\n"
        '    }\n'
        '}\n',
      );
    });

    test('text/plain', () {
      final operation = {
        'tags': ['pet'],
        'summary': 'Uploads an image.',
        'operationId': 'uploadFile',
        'requestBody': {
          'content': {
            'text/plain': {
              'schema': {'type': 'string'},
            },
          },
        },
        'responses': {
          '200': {'description': 'successful operation'},
        },
      };
      final result = renderTestOperation(
        path: '/pet/{petId}/uploadFile',
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
        '    Future<void> uploadFile(\n'
        '        { String? string, }\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/pet/{petId}/uploadFile'\n"
        ',\n'
        '            body: string,\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$uploadFile');\n"
        '    }\n'
        '}\n',
      );
    });

    test('multiple successful responses with different content not supported', () {
      final json = {
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
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<UsersResponse> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersResponse.fromJson(jsonDecode(response.body) as dynamic);\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });

    test('multiple successful responses with same content is supported', () {
      final json = {
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
                'schema': {'type': 'boolean'},
              },
            },
          },
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<bool> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return jsonDecode(response.body) as bool;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });

    test('multiple successful responses with content ignores empty responses', () {
      final json = {
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
          '204': {
            'description': 'No content',
            'content': {
              'application/json': {
                // This doesn't error because schema is empty.
                // This is a hack for Space Traders get-cooldown.
                'schema': {'description': 'No content'},
              },
            },
          },
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<UsersResponse> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return UsersResponse.fromJson(jsonDecode(response.body) as dynamic);\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });

    test('multiple responses with content ignores non-successful responses', () {
      final json = {
        'responses': {
          '200': {
            'description': 'OK',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
          '404': {
            'description': 'Not Found',
            'content': {
              'application/json': {
                'schema': {'type': 'boolean'},
              },
            },
          },
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    Future<bool> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return jsonDecode(response.body) as bool;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });

    test('No successful responses', () {
      final json = {
        'summary': 'Get user',
        'responses': {
          '400': {'description': 'Bad Request'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });

    test('string with default', () {
      final json = {
        'summary': 'Get user',
        'parameters': [
          {
            'name': 'foo',
            'in': 'query',
            'description': 'Foo',
            'schema': {'type': 'string', 'default': 'bar'},
          },
        ],
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        "        { String? foo = 'bar', }\n"
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'foo': ?foo.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });
    test('openapi quirks all lists to empty default', () {
      final json = {
        'summary': 'Get user',
        'parameters': [
          {
            'name': 'foo',
            'in': 'query',
            'description': 'Foo',
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
      const quirks = Quirks();
      // If this expectation changes, set an explicit quirks for renderOperation
      expect(quirks.allListsDefaultToEmpty, isTrue);
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
        // Using default quirks.
      );
      expect(
        result,
        // This expectation is wrong.  foo should just default to null
        // even when quirking for OpenAPI.  Example:
        // https://github.com/eseidel/space_traders/blob/a40923167bb6fec2069ec3c42b6ff69c7fc14439/packages/openapi/lib/api/systems_api.dart#L482
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        '        { List<String>? foo = const [], }\n'
        '    ) async {\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'foo': ?foo.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });

    test('optional newtype parameters', () {
      final json = {
        'operationId': 'get-agents',
        'summary': 'List all public agent details.',
        'tags': ['Agents'],
        'description': 'List all public agent details.',
        'parameters': [
          {
            'schema': {'type': 'integer', 'minimum': 1, 'default': 1},
            'in': 'query',
            'name': 'page',
            'description': 'What entry offset to request',
          },
        ],
        'responses': {
          '200': {'description': 'Successfully fetched agents details.'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class AgentsApi {\n'
        '    AgentsApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// List all public agent details.\n'
        '    /// List all public agent details.\n'
        '    Future<void> getAgents(\n'
        '        { int? page = 1, }\n'
        '    ) async {\n'
        '        page?.validateMinimum(1);\n'
        '\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'page': ?page.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$getAgents');\n"
        '    }\n'
        '}\n',
      );
    });

    test('validation statements', () {
      final json = {
        'summary': 'Get user',
        'parameters': [
          {
            'name': 'foo',
            'in': 'query',
            'description': 'Foo',
            'schema': {
              'type': 'string',
              'minLength': 1,
              'maxLength': 10,
              'pattern': r'^[a-z]+$',
            },
          },
          {
            'name': 'bar',
            'in': 'query',
            'description': 'Bar',
            'schema': {
              'type': 'integer',
              'minimum': 1,
              'maximum': 10,
              'exclusiveMinimum': 1,
              'exclusiveMaximum': 10,
              'multipleOf': 2,
            },
          },
          {
            'name': 'baz',
            'in': 'query',
            'description': 'Baz',
            'schema': {
              'type': 'number',
              'multipleOf': 0.1,
              'minimum': 0.1,
              'maximum': 10,
              'exclusiveMinimum': 0.1,
              'exclusiveMaximum': 10.2,
            },
          },
        ],
        'responses': {
          '200': {'description': 'OK'},
        },
      };
      final result = renderTestOperation(
        path: '/users',
        operationJson: json,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
      );
      expect(
        result,
        '/// Test API\n'
        'class DefaultApi {\n'
        '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
        '\n'
        '    final ApiClient client;\n'
        '\n'
        '    /// Get user\n'
        '    Future<void> users(\n'
        '        { String? foo,int? bar,double? baz, }\n'
        '    ) async {\n'
        '        foo?.validateMaximumLength(10);\n'
        '        foo?.validateMinimumLength(1);\n'
        "        foo?.validatePattern('^[a-z]+\$');\n"
        '        bar?.validateMaximum(10);\n'
        '        bar?.validateMinimum(1);\n'
        '        bar?.validateExclusiveMaximum(10);\n'
        '        bar?.validateExclusiveMinimum(1);\n'
        '        bar?.validateMultipleOf(2);\n'
        '        baz?.validateMaximum(10.0);\n'
        '        baz?.validateMinimum(0.1);\n'
        '        baz?.validateExclusiveMaximum(10.2);\n'
        '        baz?.validateExclusiveMinimum(0.1);\n'
        '        baz?.validateMultipleOf(0.1);\n'
        '\n'
        '        final response = await client.invokeApi(\n'
        '            method: Method.post,\n'
        "            path: '/users'\n"
        ',\n'
        '            queryParameters: {\n'
        "                'foo': ?foo.toString(),\n"
        "                'bar': ?bar.toString(),\n"
        "                'baz': ?baz.toString(),\n"
        '            },\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n',
      );
    });

    group('multiple types', () {
      test('string or number', () {
        final json = {
          'summary': 'Get user',
          'parameters': [
            {
              'name': 'foo',
              'in': 'query',
              'description': 'Foo',
              'schema': {
                'type': ['string', 'number'],
              },
            },
          ],
          'responses': {
            '200': {'description': 'OK'},
          },
        };
        final result = renderTestOperation(
          path: '/users',
          operationJson: json,
          serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
        );
        // TODO(eseidel): Use dynamic instead of UsersParameter0.
        expect(
          result,
          '/// Test API\n'
          'class DefaultApi {\n'
          '    DefaultApi(ApiClient? client) : client = client ?? ApiClient();\n'
          '\n'
          '    final ApiClient client;\n'
          '\n'
          '    /// Get user\n'
          '    Future<void> users(\n'
          '        { UsersParameter0? foo, }\n'
          '    ) async {\n'
          '        final response = await client.invokeApi(\n'
          '            method: Method.post,\n'
          "            path: '/users'\n"
          ',\n'
          '            queryParameters: {\n'
          "                'foo': ?foo?.toJson().toString(),\n"
          '            },\n'
          '        );\n'
          '\n'
          '        if (response.statusCode >= HttpStatus.badRequest) {\n'
          '            throw ApiException(response.statusCode, response.body.toString());\n'
          '        }\n'
          '\n'
          '        if (response.body.isNotEmpty) {\n'
          '            return ;\n'
          '        }\n'
          '\n'
          "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
          '    }\n'
          '}\n',
        );
      });
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
      final result = renderTestApiFromSpec(
        specJson: spec,
        serverUrl: Uri.parse('https://api.spacetraders.io/v2'),
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
        "            path: '/users'\n"
        ',\n'
        '        );\n'
        '\n'
        '        if (response.statusCode >= HttpStatus.badRequest) {\n'
        '            throw ApiException(response.statusCode, response.body.toString());\n'
        '        }\n'
        '\n'
        '        if (response.body.isNotEmpty) {\n'
        '            return ;\n'
        '        }\n'
        '\n'
        "        throw ApiException(response.statusCode, 'Unhandled response from \$users');\n"
        '    }\n'
        '}\n'
        '',
      );
    });
  });
}
