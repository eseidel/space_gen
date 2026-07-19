import 'package:discord/messages/poll_answer_create_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/poll_layout_types.dart';
import 'package:discord/models/poll_media.dart';
import 'package:meta/meta.dart';

@immutable
class PollCreateRequest {
  const PollCreateRequest({
    required this.question,
    required this.answers,
    this.allowMultiselect,
    this.layoutType,
    this.duration,
  });

  /// Converts a `Map<String, dynamic>` to a [PollCreateRequest].
  factory PollCreateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollCreateRequest',
      json,
      () => PollCreateRequest(
        question: PollMedia.fromJson(json['question'] as Map<String, dynamic>),
        answers: (json['answers'] as List)
            .map<PollAnswerCreateRequest>(
              (e) =>
                  PollAnswerCreateRequest.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        allowMultiselect: json['allow_multiselect'] as bool?,
        layoutType: PollLayoutTypes.maybeFromJson(
          json['layout_type'] as Map<String, dynamic>?,
        ),
        duration: json['duration'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollCreateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollCreateRequest.fromJson(json);
  }

  final PollMedia question;
  final List<PollAnswerCreateRequest> answers;
  final bool? allowMultiselect;
  final PollLayoutTypes? layoutType;
  final int? duration;

  /// Converts a [PollCreateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'question': question.toJson(),
      'answers': answers.map((e) => e.toJson()).toList(),
      'allow_multiselect': allowMultiselect,
      'layout_type': layoutType?.toJson(),
      'duration': duration,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    question,
    listHash(answers),
    allowMultiselect,
    layoutType,
    duration,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollCreateRequest &&
        question == other.question &&
        listsEqual(answers, other.answers) &&
        allowMultiselect == other.allowMultiselect &&
        layoutType == other.layoutType &&
        duration == other.duration;
  }
}
