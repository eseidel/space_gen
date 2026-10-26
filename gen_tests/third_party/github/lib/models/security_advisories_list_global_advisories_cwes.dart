// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class SecurityAdvisoriesListGlobalAdvisoriesCwes {
  const SecurityAdvisoriesListGlobalAdvisoriesCwes();

  factory SecurityAdvisoriesListGlobalAdvisoriesCwes.fromJson(dynamic json) {
    return switch (json) {
      final String v => SecurityAdvisoriesListGlobalAdvisoriesCwesString(v),
      final List<dynamic> v => SecurityAdvisoriesListGlobalAdvisoriesCwesList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for SecurityAdvisoriesListGlobalAdvisoriesCwes: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecurityAdvisoriesListGlobalAdvisoriesCwes? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return SecurityAdvisoriesListGlobalAdvisoriesCwes.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesCwesString
    extends SecurityAdvisoriesListGlobalAdvisoriesCwes {
  const SecurityAdvisoriesListGlobalAdvisoriesCwesString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesCwesString &&
        value == other.value;
  }
}

@immutable
final class SecurityAdvisoriesListGlobalAdvisoriesCwesList
    extends SecurityAdvisoriesListGlobalAdvisoriesCwes {
  const SecurityAdvisoriesListGlobalAdvisoriesCwesList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecurityAdvisoriesListGlobalAdvisoriesCwesList &&
        value == other.value;
  }
}
