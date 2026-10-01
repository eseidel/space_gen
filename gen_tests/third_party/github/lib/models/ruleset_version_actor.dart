// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template ruleset_version_actor}
/// The actor who updated the ruleset
/// {@endtemplate}
@immutable
class RulesetVersionActor {
  /// {@macro ruleset_version_actor}
  const RulesetVersionActor({this.id, this.type});

  /// Converts a `Map<String, dynamic>` to a [RulesetVersionActor].
  factory RulesetVersionActor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RulesetVersionActor',
      json,
      () => RulesetVersionActor(
        id: json['id'] as int?,
        type: json['type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RulesetVersionActor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RulesetVersionActor.fromJson(json);
  }

  final int? id;
  final String? type;

  /// Converts a [RulesetVersionActor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': ?id, 'type': ?type};
  }

  @override
  int get hashCode => Object.hashAll([id, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RulesetVersionActor && id == other.id && type == other.type;
  }
}
