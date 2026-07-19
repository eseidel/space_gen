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
import 'package:discord/messages/application_command_user_option_response.dart';
import 'package:meta/meta.dart';

sealed class ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInner();

  factory ApplicationCommandSubcommandOptionResponseOptionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      11 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandAttachmentOptionResponse(
          ApplicationCommandAttachmentOptionResponse.fromJson(json),
        ),
      5 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandBooleanOptionResponse(
          ApplicationCommandBooleanOptionResponse.fromJson(json),
        ),
      7 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandChannelOptionResponse(
          ApplicationCommandChannelOptionResponse.fromJson(json),
        ),
      4 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandIntegerOptionResponse(
          ApplicationCommandIntegerOptionResponse.fromJson(json),
        ),
      9 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandMentionableOptionResponse(
          ApplicationCommandMentionableOptionResponse.fromJson(json),
        ),
      10 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandNumberOptionResponse(
          ApplicationCommandNumberOptionResponse.fromJson(json),
        ),
      8 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandRoleOptionResponse(
          ApplicationCommandRoleOptionResponse.fromJson(json),
        ),
      3 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandStringOptionResponse(
          ApplicationCommandStringOptionResponse.fromJson(json),
        ),
      6 =>
        ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandUserOptionResponse(
          ApplicationCommandUserOptionResponse.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ApplicationCommandSubcommandOptionResponseOptionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandSubcommandOptionResponseOptionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandSubcommandOptionResponseOptionsInner.fromJson(
      json,
    );
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandAttachmentOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandAttachmentOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandAttachmentOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandBooleanOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandBooleanOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandBooleanOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandChannelOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandChannelOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandChannelOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandIntegerOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandIntegerOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandIntegerOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandMentionableOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandMentionableOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandMentionableOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandNumberOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandNumberOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandNumberOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandRoleOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandRoleOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandRoleOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandStringOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandStringOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandStringOptionResponse &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandUserOptionResponse
    extends ApplicationCommandSubcommandOptionResponseOptionsInner {
  const ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandUserOptionResponse(
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
            is ApplicationCommandSubcommandOptionResponseOptionsInnerApplicationCommandUserOptionResponse &&
        value == other.value;
  }
}
