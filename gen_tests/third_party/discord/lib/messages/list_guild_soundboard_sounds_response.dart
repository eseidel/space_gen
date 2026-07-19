import 'package:discord/messages/soundboard_sound_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ListGuildSoundboardSoundsResponse {
  const ListGuildSoundboardSoundsResponse({required this.items});

  /// Converts a `Map<String, dynamic>` to a
  /// [ListGuildSoundboardSoundsResponse].
  factory ListGuildSoundboardSoundsResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ListGuildSoundboardSoundsResponse',
      json,
      () => ListGuildSoundboardSoundsResponse(
        items: (json['items'] as List)
            .map<SoundboardSoundResponse>(
              (e) =>
                  SoundboardSoundResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ListGuildSoundboardSoundsResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ListGuildSoundboardSoundsResponse.fromJson(json);
  }

  final List<SoundboardSoundResponse> items;

  /// Converts a [ListGuildSoundboardSoundsResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'items': items.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(items).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ListGuildSoundboardSoundsResponse &&
        listsEqual(items, other.items);
  }
}
