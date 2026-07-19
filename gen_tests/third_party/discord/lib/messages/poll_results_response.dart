import 'package:discord/messages/poll_results_entry_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PollResultsResponse {
  const PollResultsResponse({
    required this.answerCounts,
    required this.isFinalized,
  });

  /// Converts a `Map<String, dynamic>` to a [PollResultsResponse].
  factory PollResultsResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollResultsResponse',
      json,
      () => PollResultsResponse(
        answerCounts: (json['answer_counts'] as List)
            .map<PollResultsEntryResponse>(
              (e) =>
                  PollResultsEntryResponse.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        isFinalized: json['is_finalized'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollResultsResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollResultsResponse.fromJson(json);
  }

  final List<PollResultsEntryResponse> answerCounts;
  final bool isFinalized;

  /// Converts a [PollResultsResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'answer_counts': answerCounts.map((e) => e.toJson()).toList(),
      'is_finalized': isFinalized,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(answerCounts), isFinalized]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollResultsResponse &&
        listsEqual(answerCounts, other.answerCounts) &&
        isFinalized == other.isFinalized;
  }
}
