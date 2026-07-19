// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/models/application_command_attachment_option.dart';
import 'package:discord/models/application_command_boolean_option.dart';
import 'package:discord/models/application_command_channel_option.dart';
import 'package:discord/models/application_command_integer_option.dart';
import 'package:discord/models/application_command_mentionable_option.dart';
import 'package:discord/models/application_command_number_option.dart';
import 'package:discord/models/application_command_role_option.dart';
import 'package:discord/models/application_command_string_option.dart';
import 'package:discord/models/application_command_subcommand_group_option.dart';
import 'package:discord/models/application_command_subcommand_option.dart';
import 'package:discord/models/application_command_user_option.dart';
import 'package:meta/meta.dart';

sealed class ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInner();

  factory ApplicationCommandCreateRequestOptionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      11 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandAttachmentOption(
          ApplicationCommandAttachmentOption.fromJson(json),
        ),
      5 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandBooleanOption(
          ApplicationCommandBooleanOption.fromJson(json),
        ),
      7 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandChannelOption(
          ApplicationCommandChannelOption.fromJson(json),
        ),
      4 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandIntegerOption(
          ApplicationCommandIntegerOption.fromJson(json),
        ),
      9 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandMentionableOption(
          ApplicationCommandMentionableOption.fromJson(json),
        ),
      10 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandNumberOption(
          ApplicationCommandNumberOption.fromJson(json),
        ),
      8 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandRoleOption(
          ApplicationCommandRoleOption.fromJson(json),
        ),
      3 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandStringOption(
          ApplicationCommandStringOption.fromJson(json),
        ),
      2 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandGroupOption(
          ApplicationCommandSubcommandGroupOption.fromJson(json),
        ),
      1 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandOption(
          ApplicationCommandSubcommandOption.fromJson(json),
        ),
      6 =>
        ApplicationCommandCreateRequestOptionsInnerApplicationCommandUserOption(
          ApplicationCommandUserOption.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ApplicationCommandCreateRequestOptionsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApplicationCommandCreateRequestOptionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandCreateRequestOptionsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandAttachmentOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandAttachmentOption(
    this.value,
  );

  final ApplicationCommandAttachmentOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandAttachmentOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandBooleanOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandBooleanOption(
    this.value,
  );

  final ApplicationCommandBooleanOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandBooleanOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandChannelOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandChannelOption(
    this.value,
  );

  final ApplicationCommandChannelOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandChannelOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandIntegerOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandIntegerOption(
    this.value,
  );

  final ApplicationCommandIntegerOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandIntegerOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandMentionableOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandMentionableOption(
    this.value,
  );

  final ApplicationCommandMentionableOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandMentionableOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandNumberOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandNumberOption(
    this.value,
  );

  final ApplicationCommandNumberOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandNumberOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandRoleOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandRoleOption(
    this.value,
  );

  final ApplicationCommandRoleOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandRoleOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandStringOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandStringOption(
    this.value,
  );

  final ApplicationCommandStringOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandStringOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandGroupOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandGroupOption(
    this.value,
  );

  final ApplicationCommandSubcommandGroupOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandGroupOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandOption(
    this.value,
  );

  final ApplicationCommandSubcommandOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandSubcommandOption &&
        value == other.value;
  }
}

@immutable
final class ApplicationCommandCreateRequestOptionsInnerApplicationCommandUserOption
    extends ApplicationCommandCreateRequestOptionsInner {
  const ApplicationCommandCreateRequestOptionsInnerApplicationCommandUserOption(
    this.value,
  );

  final ApplicationCommandUserOption value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ApplicationCommandCreateRequestOptionsInnerApplicationCommandUserOption &&
        value == other.value;
  }
}
