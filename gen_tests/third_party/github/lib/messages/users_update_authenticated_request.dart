import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UsersUpdateAuthenticatedRequest {
  const UsersUpdateAuthenticatedRequest({
    this.name,
    this.email,
    this.blog,
    this.twitterUsername,
    this.company,
    this.location,
    this.hireable,
    this.bio,
  });

  /// Converts a `Map<String, dynamic>` to a [UsersUpdateAuthenticatedRequest].
  factory UsersUpdateAuthenticatedRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UsersUpdateAuthenticatedRequest',
      json,
      () => UsersUpdateAuthenticatedRequest(
        name: json['name'] as String?,
        email: json['email'] as String?,
        blog: json['blog'] as String?,
        twitterUsername: json['twitter_username'] as String?,
        company: json['company'] as String?,
        location: json['location'] as String?,
        hireable: json['hireable'] as bool?,
        bio: json['bio'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UsersUpdateAuthenticatedRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UsersUpdateAuthenticatedRequest.fromJson(json);
  }

  /// The new name of the user.
  /// Example: `'Omar Jahandar'`
  final String? name;

  /// The publicly visible email address of the user.
  /// Example: `'omar@example.com'`
  final String? email;

  /// The new blog URL of the user.
  /// Example: `'blog.example.com'`
  final String? blog;

  /// The new Twitter username of the user.
  /// Example: `'therealomarj'`
  final String? twitterUsername;

  /// The new company of the user.
  /// Example: `'Acme corporation'`
  final String? company;

  /// The new location of the user.
  /// Example: `'Berlin, Germany'`
  final String? location;

  /// The new hiring availability of the user.
  final bool? hireable;

  /// The new short biography of the user.
  final String? bio;

  /// Converts a [UsersUpdateAuthenticatedRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': ?name,
      'email': ?email,
      'blog': ?blog,
      'twitter_username': twitterUsername,
      'company': ?company,
      'location': ?location,
      'hireable': ?hireable,
      'bio': ?bio,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    email,
    blog,
    twitterUsername,
    company,
    location,
    hireable,
    bio,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersUpdateAuthenticatedRequest &&
        name == other.name &&
        email == other.email &&
        blog == other.blog &&
        twitterUsername == other.twitterUsername &&
        company == other.company &&
        location == other.location &&
        hireable == other.hireable &&
        bio == other.bio;
  }
}
