import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template scanned_ship_frame}
/// The frame of the ship.
/// {@endtemplate}
@immutable
class ScannedShipFrame {
  /// {@macro scanned_ship_frame}
  const ScannedShipFrame({required this.symbol});

  /// Converts a `Map<String, dynamic>` to a [ScannedShipFrame].
  factory ScannedShipFrame.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ScannedShipFrame',
      json,
      () => ScannedShipFrame(symbol: json['symbol'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ScannedShipFrame? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ScannedShipFrame.fromJson(json);
  }

  /// The symbol of the frame.
  final String symbol;

  /// Converts a [ScannedShipFrame] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'symbol': symbol};
  }

  @override
  int get hashCode => symbol.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ScannedShipFrame && symbol == other.symbol;
  }
}
