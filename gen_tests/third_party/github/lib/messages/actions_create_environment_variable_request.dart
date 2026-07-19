import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateEnvironmentVariableRequest {
  const ActionsCreateEnvironmentVariableRequest({
    required this.name,
    required this.value,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateEnvironmentVariableRequest].
  factory ActionsCreateEnvironmentVariableRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsCreateEnvironmentVariableRequest',
      json,
      () => ActionsCreateEnvironmentVariableRequest(
        name: json['name'] as String,
        value: json['value'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateEnvironmentVariableRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateEnvironmentVariableRequest.fromJson(json);
  }

  /// The name of the variable.
  final String name;

  /// The value of the variable.
  final String value;

  /// Converts an [ActionsCreateEnvironmentVariableRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value};
  }

  @override
  int get hashCode => Object.hashAll([name, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateEnvironmentVariableRequest &&
        name == other.name &&
        value == other.value;
  }
}
