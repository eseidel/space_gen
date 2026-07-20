import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MessageAttachmentRequest {
  MessageAttachmentRequest({
    required this.id,
    this.filename,
    this.description,
    this.durationSecs,
    this.waveform,
    this.title,
    this.isRemix,
  }) {
    filename?.validate(maxLength: 1024);
    description?.validate(maxLength: 1024);
    durationSecs?.validate(min: 0.0, max: 2147483647.0);
    waveform?.validate(maxLength: 400);
    title?.validate(maxLength: 1024);
  }

  /// Converts a `Map<String, dynamic>` to a [MessageAttachmentRequest].
  factory MessageAttachmentRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MessageAttachmentRequest',
      json,
      () => MessageAttachmentRequest(
        id: SnowflakeType.fromJson(json['id'] as String),
        filename: json['filename'] as String?,
        description: json['description'] as String?,
        durationSecs: (json['duration_secs'] as num?)?.toDouble(),
        waveform: json['waveform'] as String?,
        title: json['title'] as String?,
        isRemix: json['is_remix'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageAttachmentRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MessageAttachmentRequest.fromJson(json);
  }

  final SnowflakeType id;
  final String? filename;
  final String? description;
  final double? durationSecs;
  final String? waveform;
  final String? title;
  final bool? isRemix;

  /// Converts a [MessageAttachmentRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'filename': filename,
      'description': description,
      'duration_secs': durationSecs,
      'waveform': waveform,
      'title': title,
      'is_remix': isRemix,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    filename,
    description,
    durationSecs,
    waveform,
    title,
    isRemix,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageAttachmentRequest &&
        id == other.id &&
        filename == other.filename &&
        description == other.description &&
        durationSecs == other.durationSecs &&
        waveform == other.waveform &&
        title == other.title &&
        isRemix == other.isRemix;
  }
}
