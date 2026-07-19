import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TeamOrganizationPlan {
  const TeamOrganizationPlan({
    required this.name,
    required this.space,
    required this.privateRepos,
    this.filledSeats,
    this.seats,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamOrganizationPlan].
  factory TeamOrganizationPlan.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamOrganizationPlan',
      json,
      () => TeamOrganizationPlan(
        name: json['name'] as String,
        space: json['space'] as int,
        privateRepos: json['private_repos'] as int,
        filledSeats: json['filled_seats'] as int?,
        seats: json['seats'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamOrganizationPlan? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamOrganizationPlan.fromJson(json);
  }

  final String name;
  final int space;
  final int privateRepos;
  final int? filledSeats;
  final int? seats;

  /// Converts a [TeamOrganizationPlan] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'space': space,
      'private_repos': privateRepos,
      if (filledSeats != null) 'filled_seats': filledSeats,
      if (seats != null) 'seats': seats,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, space, privateRepos, filledSeats, seats]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamOrganizationPlan &&
        name == other.name &&
        space == other.space &&
        privateRepos == other.privateRepos &&
        filledSeats == other.filledSeats &&
        seats == other.seats;
  }
}
