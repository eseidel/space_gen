// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class SecurityAdvisoriesListGlobalAdvisoriesAffects {
  const SecurityAdvisoriesListGlobalAdvisoriesAffects();

  factory SecurityAdvisoriesListGlobalAdvisoriesAffects.fromJson(dynamic json) {
    return switch (json) {
      final String v => SecurityAdvisoriesListGlobalAdvisoriesAffectsString(v),
      final List<dynamic> v =>
        SecurityAdvisoriesListGlobalAdvisoriesAffectsList(v.cast<String>()),
      _ => throw FormatException(
        'Unsupported shape for SecurityAdvisoriesListGlobalAdvisoriesAffects: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesAffects? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesAffects.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesAffectsString
    extends SecurityAdvisoriesListGlobalAdvisoriesAffects {
  const SecurityAdvisoriesListGlobalAdvisoriesAffectsString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesAffectsString &&
        value == other.value;
  }
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesAffectsList
    extends SecurityAdvisoriesListGlobalAdvisoriesAffects {
  const SecurityAdvisoriesListGlobalAdvisoriesAffectsList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesAffectsList &&
        value == other.value;
  }
}
