import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsUpdateEnvironmentVariableRequest {
  const ActionsUpdateEnvironmentVariableRequest({this.name, this.value});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsUpdateEnvironmentVariableRequest].
  factory ActionsUpdateEnvironmentVariableRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsUpdateEnvironmentVariableRequest',
      json,
      () => ActionsUpdateEnvironmentVariableRequest(
        name: json['name'] as String?,
        value: json['value'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsUpdateEnvironmentVariableRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsUpdateEnvironmentVariableRequest.fromJson(json);
  }

  /// The name of the variable.
  final String? name;

  /// The value of the variable.
  final String? value;

  /// Converts an [ActionsUpdateEnvironmentVariableRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (name != null) 'name': name, if (value != null) 'value': value};
  }

  @override
  int get hashCode => Object.hashAll([name, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsUpdateEnvironmentVariableRequest &&
        name == other.name &&
        value == other.value;
  }
}
