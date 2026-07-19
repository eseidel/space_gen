// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class SecurityAdvisoriesListGlobalAdvisoriesParameter7 {
  const SecurityAdvisoriesListGlobalAdvisoriesParameter7();

  factory SecurityAdvisoriesListGlobalAdvisoriesParameter7.fromJson(
    dynamic json,
  ) {
    return switch (json) {
      final String v => SecurityAdvisoriesListGlobalAdvisoriesParameter7String(
        v,
      ),
      final List<dynamic> v =>
        SecurityAdvisoriesListGlobalAdvisoriesParameter7List(v.cast<String>()),
      _ => throw FormatException(
        'Unsupported shape for SecurityAdvisoriesListGlobalAdvisoriesParameter7: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesParameter7? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesParameter7.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesParameter7String
    extends SecurityAdvisoriesListGlobalAdvisoriesParameter7 {
  const SecurityAdvisoriesListGlobalAdvisoriesParameter7String(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesParameter7String &&
        value == other.value;
  }
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesParameter7List
    extends SecurityAdvisoriesListGlobalAdvisoriesParameter7 {
  const SecurityAdvisoriesListGlobalAdvisoriesParameter7List(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesParameter7List &&
        value == other.value;
  }
}
