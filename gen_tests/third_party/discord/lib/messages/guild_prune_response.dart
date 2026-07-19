import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildPruneResponse {
  const GuildPruneResponse({required this.pruned});

  /// Converts a `Map<String, dynamic>` to a [GuildPruneResponse].
  factory GuildPruneResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildPruneResponse',
      json,
      () => GuildPruneResponse(pruned: checkedKey(json, 'pruned') as int?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildPruneResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildPruneResponse.fromJson(json);
  }

  final int? pruned;

  /// Converts a [GuildPruneResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'pruned': pruned};
  }

  @override
  int get hashCode => pruned.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildPruneResponse && pruned == other.pruned;
  }
}
