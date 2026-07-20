import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/modal_interaction_callback_request_data_components_inner.dart';
import 'package:meta/meta.dart';

@immutable
class ModalInteractionCallbackRequestData {
  ModalInteractionCallbackRequestData({
    required this.customId,
    required this.title,
    required this.components,
  }) {
    customId.validate(minLength: 1, maxLength: 100);
    title.validate(minLength: 1, maxLength: 45);
    components.validate(minItems: 1, maxItems: 40);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [ModalInteractionCallbackRequestData].
  factory ModalInteractionCallbackRequestData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ModalInteractionCallbackRequestData',
      json,
      () => ModalInteractionCallbackRequestData(
        customId: json['custom_id'] as String,
        title: json['title'] as String,
        components: (json['components'] as List)
            .map<ModalInteractionCallbackRequestDataComponentsInner>(
              (e) =>
                  ModalInteractionCallbackRequestDataComponentsInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ModalInteractionCallbackRequestData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ModalInteractionCallbackRequestData.fromJson(json);
  }

  final String customId;
  final String title;
  final List<ModalInteractionCallbackRequestDataComponentsInner> components;

  /// Converts a [ModalInteractionCallbackRequestData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'custom_id': customId,
      'title': title,
      'components': components.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([customId, title, listHash(components)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ModalInteractionCallbackRequestData &&
        customId == other.customId &&
        title == other.title &&
        listsEqual(components, other.components);
  }
}
