import 'package:discord/messages/application_response.dart';
import 'package:discord/messages/user_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class AttachmentResponse {
  const AttachmentResponse({
    required this.id,
    required this.filename,
    required this.size,
    required this.url,
    required this.proxyUrl,
    this.width,
    this.height,
    this.durationSecs,
    this.waveform,
    this.description,
    this.contentType,
    this.ephemeral,
    this.flags,
    this.placeholder,
    this.placeholderVersion,
    this.title,
    this.application,
    this.clipCreatedAt,
    this.clipParticipants,
  });

  /// Converts a `Map<String, dynamic>` to an [AttachmentResponse].
  factory AttachmentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AttachmentResponse',
      json,
      () => AttachmentResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        filename: json['filename'] as String,
        size: json['size'] as int,
        url: Uri.parse(json['url'] as String),
        proxyUrl: Uri.parse(json['proxy_url'] as String),
        width: json['width'] as int?,
        height: json['height'] as int?,
        durationSecs: (json['duration_secs'] as num?)?.toDouble(),
        waveform: json['waveform'] as String?,
        description: json['description'] as String?,
        contentType: json['content_type'] as String?,
        ephemeral: json['ephemeral'] as bool?,
        flags: json['flags'] as int?,
        placeholder: json['placeholder'] as String?,
        placeholderVersion: json['placeholder_version'] as int?,
        title: json['title'] as String?,
        application: ApplicationResponse.maybeFromJson(
          json['application'] as Map<String, dynamic>?,
        ),
        clipCreatedAt: maybeParseDateTime(json['clip_created_at'] as String?),
        clipParticipants: (json['clip_participants'] as List?)
            ?.map<UserResponse>(
              (e) => UserResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AttachmentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AttachmentResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String filename;
  final int size;
  final Uri url;
  final Uri proxyUrl;
  final int? width;
  final int? height;
  final double? durationSecs;
  final String? waveform;
  final String? description;
  final String? contentType;
  final bool? ephemeral;
  final int? flags;
  final String? placeholder;
  final int? placeholderVersion;
  final String? title;
  final ApplicationResponse? application;
  final DateTime? clipCreatedAt;
  final List<UserResponse>? clipParticipants;

  /// Converts an [AttachmentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'filename': filename,
      'size': size,
      'url': url.toString(),
      'proxy_url': proxyUrl.toString(),
      'width': ?width,
      'height': ?height,
      'duration_secs': ?durationSecs,
      'waveform': ?waveform,
      'description': ?description,
      'content_type': ?contentType,
      'ephemeral': ?ephemeral,
      'flags': ?flags,
      'placeholder': ?placeholder,
      'placeholder_version': ?placeholderVersion,
      'title': title,
      'application': ?application?.toJson(),
      'clip_created_at': ?clipCreatedAt?.toIso8601String(),
      'clip_participants': ?clipParticipants?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    filename,
    size,
    url,
    proxyUrl,
    width,
    height,
    durationSecs,
    waveform,
    description,
    contentType,
    ephemeral,
    flags,
    placeholder,
    placeholderVersion,
    title,
    application,
    clipCreatedAt,
    listHash(clipParticipants),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AttachmentResponse &&
        id == other.id &&
        filename == other.filename &&
        size == other.size &&
        url == other.url &&
        proxyUrl == other.proxyUrl &&
        width == other.width &&
        height == other.height &&
        durationSecs == other.durationSecs &&
        waveform == other.waveform &&
        description == other.description &&
        contentType == other.contentType &&
        ephemeral == other.ephemeral &&
        flags == other.flags &&
        placeholder == other.placeholder &&
        placeholderVersion == other.placeholderVersion &&
        title == other.title &&
        application == other.application &&
        clipCreatedAt == other.clipCreatedAt &&
        listsEqual(clipParticipants, other.clipParticipants);
  }
}
