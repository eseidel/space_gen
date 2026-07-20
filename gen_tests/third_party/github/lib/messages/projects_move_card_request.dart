import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ProjectsMoveCardRequest {
  ProjectsMoveCardRequest({required this.position, this.columnId}) {
    position.validate(pattern: r'^(?:top|bottom|after:\d+)$');
  }

  /// Converts a `Map<String, dynamic>` to a [ProjectsMoveCardRequest].
  factory ProjectsMoveCardRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ProjectsMoveCardRequest',
      json,
      () => ProjectsMoveCardRequest(
        position: json['position'] as String,
        columnId: json['column_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ProjectsMoveCardRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ProjectsMoveCardRequest.fromJson(json);
  }

  /// The position of the card in a column. Can be one of: `top`, `bottom`, or
  /// `after:<card_id>` to place after the specified card.
  /// Example: `'bottom'`
  final String position;

  /// The unique identifier of the column the card should be moved to
  /// Example: `42`
  final int? columnId;

  /// Converts a [ProjectsMoveCardRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'position': position, 'column_id': ?columnId};
  }

  @override
  int get hashCode => Object.hashAll([position, columnId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProjectsMoveCardRequest &&
        position == other.position &&
        columnId == other.columnId;
  }
}
