import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateVoiceChannelStatusRequest {
  UpdateVoiceChannelStatusRequest({this.status}) {
    status?.validate(maxLength: 500);
  }

  /// Converts a `Map<String, dynamic>` to a [UpdateVoiceChannelStatusRequest].
  factory UpdateVoiceChannelStatusRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateVoiceChannelStatusRequest',
      json,
      () => UpdateVoiceChannelStatusRequest(status: json['status'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateVoiceChannelStatusRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateVoiceChannelStatusRequest.fromJson(json);
  }

  /// The new voice channel status
  final String? status;

  /// Converts a [UpdateVoiceChannelStatusRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': status};
  }

  @override
  int get hashCode => status.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateVoiceChannelStatusRequest && status == other.status;
  }
}
