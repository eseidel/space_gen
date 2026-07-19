import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsCreateRepoVariableRequest {
  const ActionsCreateRepoVariableRequest({
    required this.name,
    required this.value,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsCreateRepoVariableRequest].
  factory ActionsCreateRepoVariableRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsCreateRepoVariableRequest',
      json,
      () => ActionsCreateRepoVariableRequest(
        name: json['name'] as String,
        value: json['value'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsCreateRepoVariableRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsCreateRepoVariableRequest.fromJson(json);
  }

  /// The name of the variable.
  final String name;

  /// The value of the variable.
  final String value;

  /// Converts an [ActionsCreateRepoVariableRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'value': value};
  }

  @override
  int get hashCode => Object.hashAll([name, value]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateRepoVariableRequest &&
        name == other.name &&
        value == other.value;
  }
}
