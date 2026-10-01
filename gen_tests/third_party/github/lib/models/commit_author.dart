// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/models/empty_object.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

sealed class CommitAuthor {
  const CommitAuthor();

  factory CommitAuthor.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('avatar_url')) {
      return CommitAuthorSimpleUser(SimpleUser.fromJson(json));
    }
    return CommitAuthorEmptyObject(EmptyObject.fromJson(json));
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitAuthor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitAuthor.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class CommitAuthorSimpleUser extends CommitAuthor {
  const CommitAuthorSimpleUser(this.value);

  final SimpleUser value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitAuthorSimpleUser && value == other.value;
  }
}

@immutable
final class CommitAuthorEmptyObject extends CommitAuthor {
  const CommitAuthorEmptyObject(this.value);

  final EmptyObject value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitAuthorEmptyObject && value == other.value;
  }
}
