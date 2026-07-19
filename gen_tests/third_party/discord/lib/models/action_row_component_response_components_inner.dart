// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/button_component_response.dart';
import 'package:discord/messages/channel_select_default_value_response.dart';
import 'package:discord/messages/role_select_default_value_response.dart';
import 'package:discord/messages/string_select_option_response.dart';
import 'package:discord/messages/user_select_default_value_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/channel_types.dart';
import 'package:discord/models/mentionable_select_component_response_default_values_inner.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:discord/models/text_input_style_types.dart';
import 'package:meta/meta.dart';

sealed class ActionRowComponentResponseComponentsInner {
  const ActionRowComponentResponseComponentsInner();

  factory ActionRowComponentResponseComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => ActionRowComponentResponseComponentsInnerButtonComponentResponse(
        ButtonComponentResponse.fromJson(json),
      ),
      8 => ChannelSelectComponentResponse.fromJson(json),
      7 => MentionableSelectComponentResponse.fromJson(json),
      6 => RoleSelectComponentResponse.fromJson(json),
      3 => StringSelectComponentResponse.fromJson(json),
      4 => TextInputComponentResponse.fromJson(json),
      5 => UserSelectComponentResponse.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ActionRowComponentResponseComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionRowComponentResponseComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionRowComponentResponseComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ActionRowComponentResponseComponentsInnerButtonComponentResponse
    extends ActionRowComponentResponseComponentsInner {
  const ActionRowComponentResponseComponentsInnerButtonComponentResponse(
    this.value,
  );

  final ButtonComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ActionRowComponentResponseComponentsInnerButtonComponentResponse &&
        value == other.value;
  }
}

@immutable
final class ChannelSelectComponentResponse
    extends ActionRowComponentResponseComponentsInner {
  const ChannelSelectComponentResponse({
    required this.id,
    required this.customId,
    required this.minValues,
    required this.maxValues,
    this.placeholder,
    this.disabled,
    this.channelTypes,
    this.defaultValues,
  });

  /// Converts a `Map<String, dynamic>` to a [ChannelSelectComponentResponse].
  factory ChannelSelectComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChannelSelectComponentResponse',
      json,
      () => ChannelSelectComponentResponse(
        id: json['id'] as int,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int,
        maxValues: json['max_values'] as int,
        disabled: json['disabled'] as bool?,
        channelTypes: (json['channel_types'] as List?)
            ?.map<ChannelTypes>((e) => ChannelTypes.fromJson(e as int))
            .toList(),
        defaultValues: (json['default_values'] as List?)
            ?.map<ChannelSelectDefaultValueResponse>(
              (e) => ChannelSelectDefaultValueResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChannelSelectComponentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChannelSelectComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.channelSelect;
  final int id;
  final String customId;
  final String? placeholder;
  final int minValues;
  final int maxValues;
  final bool? disabled;
  final List<ChannelTypes>? channelTypes;
  final List<ChannelSelectDefaultValueResponse>? defaultValues;

  /// Converts a [ChannelSelectComponentResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'channel_types': channelTypes?.map((e) => e.toJson()).toList(),
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    listHash(channelTypes),
    listHash(defaultValues),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChannelSelectComponentResponse &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        listsEqual(channelTypes, other.channelTypes) &&
        listsEqual(defaultValues, other.defaultValues);
  }
}

@immutable
final class MentionableSelectComponentResponse
    extends ActionRowComponentResponseComponentsInner {
  const MentionableSelectComponentResponse({
    required this.id,
    required this.customId,
    required this.minValues,
    required this.maxValues,
    this.placeholder,
    this.disabled,
    this.defaultValues,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [MentionableSelectComponentResponse].
  factory MentionableSelectComponentResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'MentionableSelectComponentResponse',
      json,
      () => MentionableSelectComponentResponse(
        id: json['id'] as int,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int,
        maxValues: json['max_values'] as int,
        disabled: json['disabled'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<MentionableSelectComponentResponseDefaultValuesInner>(
              (e) =>
                  MentionableSelectComponentResponseDefaultValuesInner.fromJson(
                    e as Map<String, dynamic>,
                  ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MentionableSelectComponentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MentionableSelectComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.mentionableSelect;
  final int id;
  final String customId;
  final String? placeholder;
  final int minValues;
  final int maxValues;
  final bool? disabled;
  final List<MentionableSelectComponentResponseDefaultValuesInner>?
  defaultValues;

  /// Converts a [MentionableSelectComponentResponse]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    listHash(defaultValues),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MentionableSelectComponentResponse &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        listsEqual(defaultValues, other.defaultValues);
  }
}

@immutable
final class RoleSelectComponentResponse
    extends ActionRowComponentResponseComponentsInner {
  const RoleSelectComponentResponse({
    required this.id,
    required this.customId,
    required this.minValues,
    required this.maxValues,
    this.placeholder,
    this.disabled,
    this.defaultValues,
  });

  /// Converts a `Map<String, dynamic>` to a [RoleSelectComponentResponse].
  factory RoleSelectComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RoleSelectComponentResponse',
      json,
      () => RoleSelectComponentResponse(
        id: json['id'] as int,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int,
        maxValues: json['max_values'] as int,
        disabled: json['disabled'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<RoleSelectDefaultValueResponse>(
              (e) => RoleSelectDefaultValueResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RoleSelectComponentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RoleSelectComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.roleSelect;
  final int id;
  final String customId;
  final String? placeholder;
  final int minValues;
  final int maxValues;
  final bool? disabled;
  final List<RoleSelectDefaultValueResponse>? defaultValues;

  /// Converts a [RoleSelectComponentResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    listHash(defaultValues),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RoleSelectComponentResponse &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        listsEqual(defaultValues, other.defaultValues);
  }
}

@immutable
final class StringSelectComponentResponse
    extends ActionRowComponentResponseComponentsInner {
  const StringSelectComponentResponse({
    required this.id,
    required this.customId,
    required this.minValues,
    required this.maxValues,
    required this.options,
    this.placeholder,
    this.disabled,
  });

  /// Converts a `Map<String, dynamic>` to a [StringSelectComponentResponse].
  factory StringSelectComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'StringSelectComponentResponse',
      json,
      () => StringSelectComponentResponse(
        id: json['id'] as int,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int,
        maxValues: json['max_values'] as int,
        disabled: json['disabled'] as bool?,
        options: (json['options'] as List)
            .map<StringSelectOptionResponse>(
              (e) => StringSelectOptionResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static StringSelectComponentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return StringSelectComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.stringSelect;
  final int id;
  final String customId;
  final String? placeholder;
  final int minValues;
  final int maxValues;
  final bool? disabled;
  final List<StringSelectOptionResponse> options;

  /// Converts a [StringSelectComponentResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'options': options.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    listHash(options),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is StringSelectComponentResponse &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        listsEqual(options, other.options);
  }
}

@immutable
final class TextInputComponentResponse
    extends ActionRowComponentResponseComponentsInner {
  const TextInputComponentResponse({
    required this.id,
    required this.customId,
    required this.style,
    required this.label,
    required this.minLength,
    required this.maxLength,
    this.value,
    this.placeholder,
    this.required_,
  });

  /// Converts a `Map<String, dynamic>` to a [TextInputComponentResponse].
  factory TextInputComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TextInputComponentResponse',
      json,
      () => TextInputComponentResponse(
        id: json['id'] as int,
        customId: json['custom_id'] as String,
        style: TextInputStyleTypes.fromJson(json['style'] as int),
        label: checkedKey(json, 'label') as String?,
        value: json['value'] as String?,
        placeholder: json['placeholder'] as String?,
        required_: json['required'] as bool?,
        minLength: checkedKey(json, 'min_length') as int?,
        maxLength: checkedKey(json, 'max_length') as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TextInputComponentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TextInputComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.textInput;
  final int id;
  final String customId;
  final TextInputStyleTypes style;
  final String? label;
  final String? value;
  final String? placeholder;
  final bool? required_;
  final int? minLength;
  final int? maxLength;

  /// Converts a [TextInputComponentResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'style': style.toJson(),
      'label': label,
      'value': value,
      'placeholder': placeholder,
      'required': required_,
      'min_length': minLength,
      'max_length': maxLength,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    style,
    label,
    value,
    placeholder,
    required_,
    minLength,
    maxLength,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TextInputComponentResponse &&
        id == other.id &&
        customId == other.customId &&
        style == other.style &&
        label == other.label &&
        value == other.value &&
        placeholder == other.placeholder &&
        required_ == other.required_ &&
        minLength == other.minLength &&
        maxLength == other.maxLength;
  }
}

@immutable
final class UserSelectComponentResponse
    extends ActionRowComponentResponseComponentsInner {
  const UserSelectComponentResponse({
    required this.id,
    required this.customId,
    required this.minValues,
    required this.maxValues,
    this.placeholder,
    this.disabled,
    this.defaultValues,
  });

  /// Converts a `Map<String, dynamic>` to a [UserSelectComponentResponse].
  factory UserSelectComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserSelectComponentResponse',
      json,
      () => UserSelectComponentResponse(
        id: json['id'] as int,
        customId: json['custom_id'] as String,
        placeholder: json['placeholder'] as String?,
        minValues: json['min_values'] as int,
        maxValues: json['max_values'] as int,
        disabled: json['disabled'] as bool?,
        defaultValues: (json['default_values'] as List?)
            ?.map<UserSelectDefaultValueResponse>(
              (e) => UserSelectDefaultValueResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserSelectComponentResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserSelectComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.userSelect;
  final int id;
  final String customId;
  final String? placeholder;
  final int minValues;
  final int maxValues;
  final bool? disabled;
  final List<UserSelectDefaultValueResponse>? defaultValues;

  /// Converts a [UserSelectComponentResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'custom_id': customId,
      'placeholder': placeholder,
      'min_values': minValues,
      'max_values': maxValues,
      'disabled': disabled,
      'default_values': defaultValues?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    customId,
    placeholder,
    minValues,
    maxValues,
    disabled,
    listHash(defaultValues),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserSelectComponentResponse &&
        id == other.id &&
        customId == other.customId &&
        placeholder == other.placeholder &&
        minValues == other.minValues &&
        maxValues == other.maxValues &&
        disabled == other.disabled &&
        listsEqual(defaultValues, other.defaultValues);
  }
}
