import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/accept_contract200_response_data.dart';

/// {@template accept_contract200_response}
/// Successfully accepted contract.
/// {@endtemplate}
@immutable
class AcceptContract200Response {
  /// {@macro accept_contract200_response}
  const AcceptContract200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to an [AcceptContract200Response].
  factory AcceptContract200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AcceptContract200Response',
      json,
      () => AcceptContract200Response(
        data: AcceptContract200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AcceptContract200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AcceptContract200Response.fromJson(json);
  }

  final AcceptContract200ResponseData data;

  /// Converts an [AcceptContract200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AcceptContract200Response && data == other.data;
  }
}
