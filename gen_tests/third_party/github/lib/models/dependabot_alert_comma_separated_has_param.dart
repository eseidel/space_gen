// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/dependabot_alert_comma_separated_has_param_one_of_1_inner.dart';
import 'package:meta/meta.dart';

sealed class DependabotAlertCommaSeparatedHasParam {
  const DependabotAlertCommaSeparatedHasParam();

  factory DependabotAlertCommaSeparatedHasParam.fromJson(dynamic json) {
    return switch (json) {
      final String v => DependabotAlertCommaSeparatedHasParamString(v),
      final List<dynamic> v => DependabotAlertCommaSeparatedHasParamList(
        v
            .map<DependabotAlertCommaSeparatedHasParamOneOf1Inner>(
              (e) => DependabotAlertCommaSeparatedHasParamOneOf1Inner.fromJson(
                e as String,
              ),
            )
            .toList(),
      ),
      _ => throw FormatException(
        'Unsupported shape for DependabotAlertCommaSeparatedHasParam: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotAlertCommaSeparatedHasParam? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return DependabotAlertCommaSeparatedHasParam.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class DependabotAlertCommaSeparatedHasParamString
    extends DependabotAlertCommaSeparatedHasParam {
  const DependabotAlertCommaSeparatedHasParamString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertCommaSeparatedHasParamString &&
        value == other.value;
  }
}

@immutable
final class DependabotAlertCommaSeparatedHasParamList
    extends DependabotAlertCommaSeparatedHasParam {
  const DependabotAlertCommaSeparatedHasParamList(this.value);

  final List<DependabotAlertCommaSeparatedHasParamOneOf1Inner> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotAlertCommaSeparatedHasParamList &&
        value == other.value;
  }
}
