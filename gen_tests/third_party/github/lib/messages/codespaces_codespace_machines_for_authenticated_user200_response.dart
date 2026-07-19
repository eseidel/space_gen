import 'package:github/model_helpers.dart';
import 'package:github/models/codespace_machine.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesCodespaceMachinesForAuthenticatedUser200Response {
  const CodespacesCodespaceMachinesForAuthenticatedUser200Response({
    required this.totalCount,
    required this.machines,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesCodespaceMachinesForAuthenticatedUser200Response].
  factory CodespacesCodespaceMachinesForAuthenticatedUser200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCodespaceMachinesForAuthenticatedUser200Response',
      json,
      () => CodespacesCodespaceMachinesForAuthenticatedUser200Response(
        totalCount: json['total_count'] as int,
        machines: (json['machines'] as List)
            .map<CodespaceMachine>(
              (e) => CodespaceMachine.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCodespaceMachinesForAuthenticatedUser200Response?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesCodespaceMachinesForAuthenticatedUser200Response.fromJson(
      json,
    );
  }

  final int totalCount;
  final List<CodespaceMachine> machines;

  /// Converts a [CodespacesCodespaceMachinesForAuthenticatedUser200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'machines': machines.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(machines)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesCodespaceMachinesForAuthenticatedUser200Response &&
        totalCount == other.totalCount &&
        listsEqual(machines, other.machines);
  }
}
