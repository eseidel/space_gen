import 'package:meta/meta.dart';
import 'package:spacetraders/model/cooldown.dart';
import 'package:spacetraders/model/survey.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class CreateSurvey201ResponseData {
  const CreateSurvey201ResponseData({
    required this.cooldown,
    this.surveys = const [],
  });

  factory CreateSurvey201ResponseData.fromJson(Map<String, dynamic> json) {
    return CreateSurvey201ResponseData(
      cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
      surveys:
          (json['surveys'] as List<dynamic>)
              .map<Survey>((e) => Survey.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateSurvey201ResponseData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateSurvey201ResponseData.fromJson(json);
  }

  final Cooldown cooldown;
  final List<Survey> surveys;

  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'surveys': surveys.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hash(cooldown, surveys);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateSurvey201ResponseData &&
        cooldown == other.cooldown &&
        listsEqual(surveys, other.surveys);
  }
}
