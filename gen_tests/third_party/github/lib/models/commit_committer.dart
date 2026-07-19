import 'package:github/models/empty_object.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

sealed class CommitCommitter {
  const CommitCommitter();

  factory CommitCommitter.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('avatar_url')) {
      return CommitCommitterSimpleUser(SimpleUser.fromJson(json));
    }
    return CommitCommitterEmptyObject(EmptyObject.fromJson(json));
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitCommitter? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitCommitter.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class CommitCommitterSimpleUser extends CommitCommitter {
  const CommitCommitterSimpleUser(this.value);

  final SimpleUser value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitCommitterSimpleUser && value == other.value;
  }
}

@immutable
final class CommitCommitterEmptyObject extends CommitCommitter {
  const CommitCommitterEmptyObject(this.value);

  final EmptyObject value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitCommitterEmptyObject && value == other.value;
  }
}
