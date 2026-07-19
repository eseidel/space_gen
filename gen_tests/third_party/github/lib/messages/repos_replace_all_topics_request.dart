import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposReplaceAllTopicsRequest {
  const ReposReplaceAllTopicsRequest({required this.names});

  /// Converts a `Map<String, dynamic>` to a [ReposReplaceAllTopicsRequest].
  factory ReposReplaceAllTopicsRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposReplaceAllTopicsRequest',
      json,
      () => ReposReplaceAllTopicsRequest(
        names: (json['names'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposReplaceAllTopicsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposReplaceAllTopicsRequest.fromJson(json);
  }

  /// An array of topics to add to the repository. Pass one or more topics to
  /// _replace_ the set of existing topics. Send an empty array (`[]`) to
  /// clear all topics from the repository. **Note:** Topic `names` will be
  /// saved as lowercase.
  final List<String> names;

  /// Converts a [ReposReplaceAllTopicsRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'names': names};
  }

  @override
  int get hashCode => listHash(names).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposReplaceAllTopicsRequest &&
        listsEqual(names, other.names);
  }
}
