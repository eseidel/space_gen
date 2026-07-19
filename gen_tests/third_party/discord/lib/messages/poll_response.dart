import 'package:discord/messages/poll_answer_response.dart';
import 'package:discord/messages/poll_media_response.dart';
import 'package:discord/messages/poll_results_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/poll_layout_types.dart';
import 'package:meta/meta.dart';

@immutable
class PollResponse {
  const PollResponse({
    required this.question,
    required this.answers,
    required this.expiry,
    required this.allowMultiselect,
    required this.layoutType,
    required this.results,
  });

  /// Converts a `Map<String, dynamic>` to a [PollResponse].
  factory PollResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollResponse',
      json,
      () => PollResponse(
        question: PollMediaResponse.fromJson(
          json['question'] as Map<String, dynamic>,
        ),
        answers: (json['answers'] as List)
            .map<PollAnswerResponse>(
              (e) => PollAnswerResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        expiry: DateTime.parse(json['expiry'] as String),
        allowMultiselect: json['allow_multiselect'] as bool,
        layoutType: PollLayoutTypes.fromJson(
          json['layout_type'] as Map<String, dynamic>,
        ),
        results: PollResultsResponse.fromJson(
          json['results'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollResponse.fromJson(json);
  }

  final PollMediaResponse question;
  final List<PollAnswerResponse> answers;
  final DateTime expiry;
  final bool allowMultiselect;
  final PollLayoutTypes layoutType;
  final PollResultsResponse results;

  /// Converts a [PollResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'question': question.toJson(),
      'answers': answers.map((e) => e.toJson()).toList(),
      'expiry': expiry.toIso8601String(),
      'allow_multiselect': allowMultiselect,
      'layout_type': layoutType.toJson(),
      'results': results.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    question,
    listHash(answers),
    expiry,
    allowMultiselect,
    layoutType,
    results,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollResponse &&
        question == other.question &&
        listsEqual(answers, other.answers) &&
        expiry == other.expiry &&
        allowMultiselect == other.allowMultiselect &&
        layoutType == other.layoutType &&
        results == other.results;
  }
}
