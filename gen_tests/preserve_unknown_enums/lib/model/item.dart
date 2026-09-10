import 'package:preserve_unknown_enums/model/priority.dart';
import 'package:preserve_unknown_enums/model/status.dart';
import 'package:preserve_unknown_enums/model_helpers.dart';

class Item {
  Item({required this.status, required this.priority});

  /// Converts a `Map<String, dynamic>` to an [Item].
  factory Item.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'Item',
      json,
      () => Item(
        status: Status.fromJson(json['status'] as String),
        priority: Priority.fromJson(json['priority'] as int),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Item? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Item.fromJson(json);
  }

  Status status;
  Priority priority;

  /// Converts an [Item] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'status': status.toJson(), 'priority': priority.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([status, priority]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Item &&
        status == other.status &&
        priority == other.priority;
  }
}
