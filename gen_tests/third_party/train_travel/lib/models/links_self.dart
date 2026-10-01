// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';

/// {@template links_self}
/// The link to the current resource.
/// {@endtemplate}
@immutable
class LinksSelf {
  /// {@macro links_self}
  const LinksSelf({this.self});

  /// Converts a `Map<String, dynamic>` to a [LinksSelf].
  factory LinksSelf.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LinksSelf',
      json,
      () => LinksSelf(self: maybeParseUri(json['self'] as String?)),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LinksSelf? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LinksSelf.fromJson(json);
  }

  final Uri? self;

  /// Converts a [LinksSelf] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'self': ?self?.toString()};
  }

  @override
  int get hashCode => self.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LinksSelf && self == other.self;
  }
}
