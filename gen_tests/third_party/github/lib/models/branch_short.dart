import 'package:github/model_helpers.dart';
import 'package:github/models/branch_short_commit.dart';
import 'package:meta/meta.dart';

/// {@template branch_short}
/// Branch Short
/// Branch Short
/// {@endtemplate}
@immutable
class BranchShort {
  /// {@macro branch_short}
  const BranchShort({
    required this.name,
    required this.commit,
    required this.protected,
  });

  /// Converts a `Map<String, dynamic>` to a [BranchShort].
  factory BranchShort.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchShort',
      json,
      () => BranchShort(
        name: json['name'] as String,
        commit: BranchShortCommit.fromJson(
          json['commit'] as Map<String, dynamic>,
        ),
        protected: json['protected'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchShort? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BranchShort.fromJson(json);
  }

  final String name;
  final BranchShortCommit commit;
  final bool protected;

  /// Converts a [BranchShort] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'commit': commit.toJson(), 'protected': protected};
  }

  @override
  int get hashCode => Object.hashAll([name, commit, protected]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchShort &&
        name == other.name &&
        commit == other.commit &&
        protected == other.protected;
  }
}
