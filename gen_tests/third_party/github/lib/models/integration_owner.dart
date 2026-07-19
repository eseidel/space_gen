import 'package:github/models/enterprise.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

sealed class IntegrationOwner {
  const IntegrationOwner();

  factory IntegrationOwner.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('events_url')) {
      return IntegrationOwnerSimpleUser(SimpleUser.fromJson(json));
    }
    if (json.containsKey('created_at')) {
      return IntegrationOwnerEnterprise(Enterprise.fromJson(json));
    }
    throw FormatException(
      'No variant of IntegrationOwner matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IntegrationOwner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IntegrationOwner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class IntegrationOwnerSimpleUser extends IntegrationOwner {
  const IntegrationOwnerSimpleUser(this.value);

  final SimpleUser value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IntegrationOwnerSimpleUser && value == other.value;
  }
}

@immutable
final class IntegrationOwnerEnterprise extends IntegrationOwner {
  const IntegrationOwnerEnterprise(this.value);

  final Enterprise value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IntegrationOwnerEnterprise && value == other.value;
  }
}
