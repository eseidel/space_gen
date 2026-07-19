import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsUpdateBranch202Response {
  const PullsUpdateBranch202Response({this.message, this.url});

  /// Converts a `Map<String, dynamic>` to a [PullsUpdateBranch202Response].
  factory PullsUpdateBranch202Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsUpdateBranch202Response',
      json,
      () => PullsUpdateBranch202Response(
        message: json['message'] as String?,
        url: json['url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsUpdateBranch202Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PullsUpdateBranch202Response.fromJson(json);
  }

  final String? message;
  final String? url;

  /// Converts a [PullsUpdateBranch202Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message,
      if (url != null) 'url': url,
    };
  }

  @override
  int get hashCode => Object.hashAll([message, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsUpdateBranch202Response &&
        message == other.message &&
        url == other.url;
  }
}
