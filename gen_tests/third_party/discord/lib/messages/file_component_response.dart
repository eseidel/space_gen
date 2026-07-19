import 'package:discord/messages/unfurled_media_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

@immutable
class FileComponentResponse {
  const FileComponentResponse({
    required this.id,
    required this.file,
    required this.name,
    required this.size,
    required this.spoiler,
  });

  /// Converts a `Map<String, dynamic>` to a [FileComponentResponse].
  factory FileComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileComponentResponse',
      json,
      () => FileComponentResponse(
        id: json['id'] as int,
        file: UnfurledMediaResponse.fromJson(
          json['file'] as Map<String, dynamic>,
        ),
        name: checkedKey(json, 'name') as String?,
        size: checkedKey(json, 'size') as int?,
        spoiler: json['spoiler'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileComponentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FileComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.file;
  final int id;
  final UnfurledMediaResponse file;
  final String? name;
  final int? size;
  final bool spoiler;

  /// Converts a [FileComponentResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'file': file.toJson(),
      'name': name,
      'size': size,
      'spoiler': spoiler,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, file, name, size, spoiler]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileComponentResponse &&
        id == other.id &&
        file == other.file &&
        name == other.name &&
        size == other.size &&
        spoiler == other.spoiler;
  }
}
