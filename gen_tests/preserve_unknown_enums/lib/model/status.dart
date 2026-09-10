import 'package:meta/meta.dart';

sealed class Status {
  const Status();

  /// Creates a Status from a json value.
  factory Status.fromJson(String json) {
    for (final value in StatusKnown.values) {
      if (value.raw == json) {
        return value;
      }
    }
    return StatusUnknown(json);
  }

  static const StatusKnown open = StatusKnown.open;
  static const StatusKnown closed = StatusKnown.closed;

  static List<StatusKnown> get values => StatusKnown.values;

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static Status? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return Status.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  String get raw;

  /// Converts the enum to its json value.
  String toJson() => raw;

  /// Returns the string form of the enum.
  @override
  String toString() => raw;
}

enum StatusKnown implements Status {
  open._('open'),
  closed._('closed');

  const StatusKnown._(this.raw);

  @override
  final String raw;

  @override
  String toJson() => raw;

  @override
  String toString() => raw;
}

@immutable
final class StatusUnknown extends Status {
  const StatusUnknown(this.raw);

  @override
  final String raw;

  @override
  int get hashCode => raw.hashCode;

  @override
  bool operator ==(Object other) => other is StatusUnknown && other.raw == raw;
}
