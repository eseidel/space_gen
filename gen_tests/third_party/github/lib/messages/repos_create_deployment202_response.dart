import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateDeployment202Response {
  const ReposCreateDeployment202Response({this.message});

  /// Converts a `Map<String, dynamic>` to a [ReposCreateDeployment202Response].
  factory ReposCreateDeployment202Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateDeployment202Response',
      json,
      () =>
          ReposCreateDeployment202Response(message: json['message'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateDeployment202Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateDeployment202Response.fromJson(json);
  }

  final String? message;

  /// Converts a [ReposCreateDeployment202Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': ?message};
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeployment202Response &&
        message == other.message;
  }
}
