import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsUpdateRepoVariableRequest {
  const ActionsUpdateRepoVariableRequest({this.name, this.value});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsUpdateRepoVariableRequest].
  factory ActionsUpdateRepoVariableRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsUpdateRepoVariableRequest',
      json,
      () => ActionsUpdateRepoVariableRequest(
        name: json['name'] as String?,
        value: json['value'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsUpdateRepoVariableRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsUpdateRepoVariableRequest.fromJson(json);
  }

  /// The name of the variable.
  final String? name;

  /// The value of the variable.
  final String? value;

  /// Converts an [ActionsUpdateRepoVariableRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value};
  }

  @override
  int get hashCode => Object.hashAll([name, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsUpdateRepoVariableRequest &&
        name == other.name &&
        value == other.value;
  }
}
