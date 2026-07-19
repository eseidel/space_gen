import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PollResultsEntryResponse {
  const PollResultsEntryResponse({
    required this.id,
    required this.count,
    required this.meVoted,
  });

  /// Converts a `Map<String, dynamic>` to a [PollResultsEntryResponse].
  factory PollResultsEntryResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PollResultsEntryResponse',
      json,
      () => PollResultsEntryResponse(
        id: json['id'] as int,
        count: json['count'] as int,
        meVoted: json['me_voted'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PollResultsEntryResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PollResultsEntryResponse.fromJson(json);
  }

  final int id;
  final int count;
  final bool meVoted;

  /// Converts a [PollResultsEntryResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'count': count, 'me_voted': meVoted};
  }

  @override
  int get hashCode => Object.hashAll([id, count, meVoted]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PollResultsEntryResponse &&
        id == other.id &&
        count == other.count &&
        meVoted == other.meVoted;
  }
}
