import 'package:null_type_property/model_helpers.dart';

class Thing {
  Thing({
    required this.id,
    this.placeholder,
  });

  /// Converts a `Map<String, dynamic>` to a [Thing].
  factory Thing.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'Thing',
      json,
      () => Thing(
        id: json['id'] as String,
        placeholder: json['placeholder'],
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Thing? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Thing.fromJson(json);
  }

  String id;

  /// Reserved for future use; valid spec says this is always null.
  dynamic placeholder;

  /// Converts a [Thing] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'placeholder': placeholder,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    placeholder,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Thing && id == other.id && placeholder == other.placeholder;
  }
}
