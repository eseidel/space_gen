import 'package:meta/meta.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template meta}
/// Meta details for pagination.
/// {@endtemplate}
@immutable
class Meta {
  /// {@macro meta}
  Meta({required this.total, this.page = 1, this.limit = 10}) {
    total.validate(min: 0);
    page.validate(min: 1);
    limit.validate(min: 1, max: 20);
  }

  /// Converts a `Map<String, dynamic>` to a [Meta].
  factory Meta.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Meta',
      json,
      () => Meta(
        total: json['total'] as int,
        page: json['page'] as int,
        limit: json['limit'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Meta? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Meta.fromJson(json);
  }

  /// Shows the total amount of items of this kind that exist.
  final int total;

  /// A page denotes an amount of items, offset from the first item. Each page
  /// holds an amount of items equal to the `limit`.
  final int page;

  /// The amount of items in each page. Limits how many items can be fetched
  /// at once.
  final int limit;

  /// Converts a [Meta] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'total': total, 'page': page, 'limit': limit};
  }

  @override
  int get hashCode => Object.hashAll([total, page, limit]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Meta &&
        total == other.total &&
        page == other.page &&
        limit == other.limit;
  }
}
