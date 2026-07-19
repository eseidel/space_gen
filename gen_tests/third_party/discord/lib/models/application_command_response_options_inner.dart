// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/application_command_attachment_option_response.dart';
import 'package:discord/messages/application_command_boolean_option_response.dart';
import 'package:discord/messages/application_command_channel_option_response.dart';
import 'package:discord/messages/application_command_integer_option_response.dart';
import 'package:discord/messages/application_command_mentionable_option_response.dart';
import 'package:discord/messages/application_command_number_option_response.dart';
import 'package:discord/messages/application_command_role_option_response.dart';
import 'package:discord/messages/application_command_string_option_response.dart';
import 'package:discord/messages/application_command_subcommand_option_response.dart';
import 'package:discord/messages/application_command_user_option_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_command_option_type.dart';
import 'package:meta/meta.dart';

sealed class ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInner();

  factory ApplicationCommandResponseOptionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      11 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandAttachmentOptionResponse(
          ApplicationCommandAttachmentOptionResponse.fromJson(json),
        ),
      5 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandBooleanOptionResponse(
          ApplicationCommandBooleanOptionResponse.fromJson(json),
        ),
      7 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandChannelOptionResponse(
          ApplicationCommandChannelOptionResponse.fromJson(json),
        ),
      4 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandIntegerOptionResponse(
          ApplicationCommandIntegerOptionResponse.fromJson(json),
        ),
      9 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandMentionableOptionResponse(
          ApplicationCommandMentionableOptionResponse.fromJson(json),
        ),
      10 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandNumberOptionResponse(
          ApplicationCommandNumberOptionResponse.fromJson(json),
        ),
      8 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandRoleOptionResponse(
          ApplicationCommandRoleOptionResponse.fromJson(json),
        ),
      3 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandStringOptionResponse(
          ApplicationCommandStringOptionResponse.fromJson(json),
        ),
      2 => ApplicationCommandSubcommandGroupOptionResponse.fromJson(json),
      1 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandSubcommandOptionResponse(
          ApplicationCommandSubcommandOptionResponse.fromJson(json),
        ),
      6 =>
        ApplicationCommandResponseOptionsInnerApplicationCommandUserOptionResponse(
          ApplicationCommandUserOptionResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ApplicationCommandResponseOptionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandResponseOptionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandResponseOptionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandAttachmentOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandAttachmentOptionResponse(
    this.value,
  );

  final ApplicationCommandAttachmentOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandAttachmentOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandBooleanOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandBooleanOptionResponse(
    this.value,
  );

  final ApplicationCommandBooleanOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandBooleanOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandChannelOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandChannelOptionResponse(
    this.value,
  );

  final ApplicationCommandChannelOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandChannelOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandIntegerOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandIntegerOptionResponse(
    this.value,
  );

  final ApplicationCommandIntegerOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandIntegerOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandMentionableOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandMentionableOptionResponse(
    this.value,
  );

  final ApplicationCommandMentionableOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandMentionableOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandNumberOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandNumberOptionResponse(
    this.value,
  );

  final ApplicationCommandNumberOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandNumberOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandRoleOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandRoleOptionResponse(
    this.value,
  );

  final ApplicationCommandRoleOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandRoleOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandStringOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandStringOptionResponse(
    this.value,
  );

  final ApplicationCommandStringOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandStringOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandSubcommandOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandSubcommandOptionResponse(
    this.value,
  );

  final ApplicationCommandSubcommandOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandSubcommandOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandResponseOptionsInnerApplicationCommandUserOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandResponseOptionsInnerApplicationCommandUserOptionResponse(
    this.value,
  );

  final ApplicationCommandUserOptionResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandResponseOptionsInnerApplicationCommandUserOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandGroupOptionResponse
    extends ApplicationCommandResponseOptionsInner {
  const ApplicationCommandSubcommandGroupOptionResponse({
    required this.name,
    required this.description,
    this.nameLocalized,
    this.nameLocalizations,
    this.descriptionLocalized,
    this.descriptionLocalizations,
    this.required_,
    this.options,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ApplicationCommandSubcommandGroupOptionResponse].
  factory ApplicationCommandSubcommandGroupOptionResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ApplicationCommandSubcommandGroupOptionResponse',
      json,
      () => ApplicationCommandSubcommandGroupOptionResponse(
        name: json['name'] as String,
        nameLocalized: json['name_localized'] as String?,
        nameLocalizations: (json['name_localizations'] as Map<String, dynamic>?)
            ?.map((key, value) => MapEntry(key, value as String)),
        description: json['description'] as String,
        descriptionLocalized: json['description_localized'] as String?,
        descriptionLocalizations:
            (json['description_localizations'] as Map<String, dynamic>?)?.map(
              (key, value) => MapEntry(key, value as String),
            ),
        required_: json['required'] as bool?,
        options: (json['options'] as List?)
            ?.map<ApplicationCommandSubcommandOptionResponse>(
              (e) => ApplicationCommandSubcommandOptionResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandSubcommandGroupOptionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandSubcommandGroupOptionResponse.fromJson(json);
  }

  ApplicationCommandOptionType get type =>
      ApplicationCommandOptionType.subCommandGroup;
  final String name;
  final String? nameLocalized;
  final Map<String, String>? nameLocalizations;
  final String description;
  final String? descriptionLocalized;
  final Map<String, String>? descriptionLocalizations;
  final bool? required_;
  final List<ApplicationCommandSubcommandOptionResponse>? options;

  /// Converts an [ApplicationCommandSubcommandGroupOptionResponse]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'name': name,
      'name_localized': nameLocalized,
      'name_localizations': nameLocalizations,
      'description': description,
      'description_localized': descriptionLocalized,
      'description_localizations': descriptionLocalizations,
      'required': required_,
      'options': options?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    nameLocalized,
    mapHash(nameLocalizations),
    description,
    descriptionLocalized,
    mapHash(descriptionLocalizations),
    required_,
    listHash(options),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApplicationCommandSubcommandGroupOptionResponse &&
        name == other.name &&
        nameLocalized == other.nameLocalized &&
        mapsEqual(nameLocalizations, other.nameLocalizations) &&
        description == other.description &&
        descriptionLocalized == other.descriptionLocalized &&
        mapsEqual(descriptionLocalizations, other.descriptionLocalizations) &&
        required_ == other.required_ &&
        listsEqual(options, other.options);
  }
}
