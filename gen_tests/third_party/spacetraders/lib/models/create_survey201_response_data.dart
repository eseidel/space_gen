import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/cooldown.dart';
import 'package:spacetraders/models/survey.dart';

@immutable
class CreateSurvey201ResponseData {
  const CreateSurvey201ResponseData({
    required this.cooldown,
    required this.surveys,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateSurvey201ResponseData].
  factory CreateSurvey201ResponseData.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateSurvey201ResponseData',
      json,
      () => CreateSurvey201ResponseData(
        cooldown: Cooldown.fromJson(json['cooldown'] as Map<String, dynamic>),
        surveys: (json['surveys'] as List)
            .map<Survey>((e) => Survey.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
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

  /// A cooldown is a period of time in which a ship cannot perform certain
  /// actions.
  final Cooldown cooldown;

  /// Surveys created by this action.
  final List<Survey> surveys;

  /// Converts a [CreateSurvey201ResponseData] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'cooldown': cooldown.toJson(),
      'surveys': surveys.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([cooldown, listHash(surveys)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateSurvey201ResponseData &&
        cooldown == other.cooldown &&
        listsEqual(surveys, other.surveys);
  }
}
