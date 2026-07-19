import 'package:discord/messages/onboarding_prompt_option_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/onboarding_prompt_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class OnboardingPromptResponse {
  const OnboardingPromptResponse({
    required this.id,
    required this.title,
    required this.options,
    required this.singleSelect,
    required this.required_,
    required this.inOnboarding,
    required this.type,
  });

  /// Converts a `Map<String, dynamic>` to an [OnboardingPromptResponse].
  factory OnboardingPromptResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OnboardingPromptResponse',
      json,
      () => OnboardingPromptResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        title: json['title'] as String,
        options: (json['options'] as List)
            .map<OnboardingPromptOptionResponse>(
              (e) => OnboardingPromptOptionResponse.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        singleSelect: json['single_select'] as bool,
        required_: json['required'] as bool,
        inOnboarding: json['in_onboarding'] as bool,
        type: OnboardingPromptType.fromJson(json['type'] as int),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OnboardingPromptResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OnboardingPromptResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String title;
  final List<OnboardingPromptOptionResponse> options;
  final bool singleSelect;
  final bool required_;
  final bool inOnboarding;
  final OnboardingPromptType type;

  /// Converts an [OnboardingPromptResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'title': title,
      'options': options.map((e) => e.toJson()).toList(),
      'single_select': singleSelect,
      'required': required_,
      'in_onboarding': inOnboarding,
      'type': type.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    title,
    listHash(options),
    singleSelect,
    required_,
    inOnboarding,
    type,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OnboardingPromptResponse &&
        id == other.id &&
        title == other.title &&
        listsEqual(options, other.options) &&
        singleSelect == other.singleSelect &&
        required_ == other.required_ &&
        inOnboarding == other.inOnboarding &&
        type == other.type;
  }
}
