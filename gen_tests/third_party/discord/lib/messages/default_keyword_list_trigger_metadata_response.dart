import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_keyword_preset_type.dart';
import 'package:meta/meta.dart';

@immutable
class DefaultKeywordListTriggerMetadataResponse {
  const DefaultKeywordListTriggerMetadataResponse({
    required this.allowList,
    required this.presets,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DefaultKeywordListTriggerMetadataResponse].
  factory DefaultKeywordListTriggerMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DefaultKeywordListTriggerMetadataResponse',
      json,
      () => DefaultKeywordListTriggerMetadataResponse(
        allowList: (json['allow_list'] as List).cast<String>(),
        presets: (json['presets'] as List)
            .map<AutomodKeywordPresetType>(
              (e) => AutomodKeywordPresetType.fromJson(e as int),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DefaultKeywordListTriggerMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DefaultKeywordListTriggerMetadataResponse.fromJson(json);
  }

  final List<String> allowList;
  final List<AutomodKeywordPresetType> presets;

  /// Converts a [DefaultKeywordListTriggerMetadataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'allow_list': allowList,
      'presets': presets.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(allowList), listHash(presets)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DefaultKeywordListTriggerMetadataResponse &&
        listsEqual(allowList, other.allowList) &&
        listsEqual(presets, other.presets);
  }
}
