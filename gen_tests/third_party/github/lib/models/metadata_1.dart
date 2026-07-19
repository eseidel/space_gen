import 'package:meta/meta.dart';

sealed class Metadata1 {
  const Metadata1();

  factory Metadata1.fromJson(dynamic json) {
    return switch (json) {
      final String v => Metadata1String(v),
      final num v => Metadata1Num(v),
      final bool v => Metadata1Bool(v),
      _ => throw FormatException(
        'Unsupported shape for Metadata1: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Metadata1? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return Metadata1.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class Metadata1String extends Metadata1 {
  const Metadata1String(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Metadata1String && value == other.value;
  }
}

@immutable
final class Metadata1Num extends Metadata1 {
  const Metadata1Num(this.value);

  final num value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Metadata1Num && value == other.value;
  }
}

@immutable
final class Metadata1Bool extends Metadata1 {
  // The wrapper has a single positional arg by design — naming it
  // would force `Wrapper(value: x)` at every call site, which buys
  // nothing for a one-field shim.
  // ignore: avoid_positional_boolean_parameters
  const Metadata1Bool(this.value);

  final bool value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Metadata1Bool && value == other.value;
  }
}
