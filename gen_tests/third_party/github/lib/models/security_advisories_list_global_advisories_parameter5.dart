// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class SecurityAdvisoriesListGlobalAdvisoriesParameter5 {
  const SecurityAdvisoriesListGlobalAdvisoriesParameter5();

  factory SecurityAdvisoriesListGlobalAdvisoriesParameter5.fromJson(
    dynamic json,
  ) {
    return switch (json) {
      final String v => SecurityAdvisoriesListGlobalAdvisoriesParameter5String(
        v,
      ),
      final List<dynamic> v =>
        SecurityAdvisoriesListGlobalAdvisoriesParameter5List(v.cast<String>()),
      _ => throw FormatException(
        'Unsupported shape for SecurityAdvisoriesListGlobalAdvisoriesParameter5: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesParameter5? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesParameter5.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesParameter5String
    extends SecurityAdvisoriesListGlobalAdvisoriesParameter5 {
  const SecurityAdvisoriesListGlobalAdvisoriesParameter5String(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesParameter5String &&
        value == other.value;
  }
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesParameter5List
    extends SecurityAdvisoriesListGlobalAdvisoriesParameter5 {
  const SecurityAdvisoriesListGlobalAdvisoriesParameter5List(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesParameter5List &&
        value == other.value;
  }
}
