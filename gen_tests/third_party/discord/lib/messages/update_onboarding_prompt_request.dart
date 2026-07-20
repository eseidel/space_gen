import 'package:discord/api_exception.dart';
import 'package:discord/messages/onboarding_prompt_option_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/onboarding_prompt_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateOnboardingPromptRequest {
  UpdateOnboardingPromptRequest({
    required this.title,
    required this.options,
    required this.id,
    this.singleSelect,
    this.required_,
    this.inOnboarding,
    this.type,
  }) {
    title.validate(minLength: 1, maxLength: 100);
    options.validate(minItems: 1, maxItems: 50);
  }

  /// Converts a `Map<String, dynamic>` to a [UpdateOnboardingPromptRequest].
  factory UpdateOnboardingPromptRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateOnboardingPromptRequest',
      json,
      () => UpdateOnboardingPromptRequest(
        title: json['title'] as String,
        options: (json['options'] as List)
            .map<OnboardingPromptOptionRequest>(
              (e) => OnboardingPromptOptionRequest.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        singleSelect: json['single_select'] as bool?,
        required_: json['required'] as bool?,
        inOnboarding: json['in_onboarding'] as bool?,
        type: OnboardingPromptType.maybeFromJson(json['type'] as int?),
        id: SnowflakeType.fromJson(json['id'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateOnboardingPromptRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UpdateOnboardingPromptRequest.fromJson(json);
  }

  final String title;
  final List<OnboardingPromptOptionRequest> options;
  final bool? singleSelect;
  final bool? required_;
  final bool? inOnboarding;
  final OnboardingPromptType? type;
  final SnowflakeType id;

  /// Converts a [UpdateOnboardingPromptRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'options': options.map((e) => e.toJson()).toList(),
      'single_select': singleSelect,
      'required': required_,
      'in_onboarding': inOnboarding,
      'type': type?.toJson(),
      'id': id.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    title,
    listHash(options),
    singleSelect,
    required_,
    inOnboarding,
    type,
    id,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateOnboardingPromptRequest &&
        title == other.title &&
        listsEqual(options, other.options) &&
        singleSelect == other.singleSelect &&
        required_ == other.required_ &&
        inOnboarding == other.inOnboarding &&
        type == other.type &&
        id == other.id;
  }
}
