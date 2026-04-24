import 'package:http/http.dart';
import 'package:meta/meta.dart';

/// An exception thrown when a required secret is missing.
class MissingSecretsException implements Exception {
  /// Create a new [MissingSecretsException].
  const MissingSecretsException(
    this.auth, [
    this.message = 'Missing required secrets for auth',
  ]);

  /// The auth request that is missing secrets.
  final AuthRequest auth;

  /// The message of the exception.
  final String message;

  @override
  String toString() => 'MissingSecretsException: $message';
}

/// The resolved headers and parameters for an auth request.
@immutable
class ResolvedAuth {
  /// Create a new [ResolvedAuth].
  const ResolvedAuth({required this.headers, required this.params});

  /// Create a new [ResolvedAuth] with no headers or parameters.
  const ResolvedAuth.noAuth() : this(headers: const {}, params: const {});

  /// The headers of the resolved auth.
  final Map<String, String> headers;

  /// The parameters of the resolved auth.
  final Map<String, String> params;

  /// Apply the resolved auth to the given headers.
  void applyToHeaders(Map<String, String> headers) {
    headers.addAll(this.headers);
  }

  /// Apply the resolved auth to the given parameters.
  void applyToParams(Map<String, String> params) {
    params.addAll(this.params);
  }

  /// Merge the given [ResolvedAuth] with the current [ResolvedAuth].
  ResolvedAuth merge(ResolvedAuth other) {
    // Should this error when replacing an existing header or parameter?
    return ResolvedAuth(
      headers: {...headers, ...other.headers},
      params: {...params, ...other.params},
    );
  }
}

/// Context passed to [AuthRequest.resolve]. Carries the secret reader and
/// the [Client] used for any network round-trips an auth scheme needs
/// (e.g. an OAuth2 token exchange).
@immutable
class AuthContext {
  /// Create a new [AuthContext].
  const AuthContext({required this.getSecret, required this.httpClient});

  /// Look up a named secret. Returns `null` when the caller has no secret
  /// under that name.
  final String? Function(String name) getSecret;

  /// HTTP client for auth flows that require an outbound request.
  final Client httpClient;
}

/// An abstract class representing an auth request.
@immutable
abstract class AuthRequest {
  const AuthRequest();

  /// Used to check if the getSecret function has all the secrets for this auth.
  bool haveSecrets(String? Function(String name) getSecret);

  /// Used to resolve the auth using the [AuthContext].
  Future<ResolvedAuth> resolve(AuthContext context);
}

/// An auth request that does nothing.
@immutable
class NoAuth extends AuthRequest {
  /// Create a new [NoAuth].
  const NoAuth();

  /// Always returns true since no auth is required.
  @override
  bool haveSecrets(String? Function(String name) getSecret) => true;

  /// Returns a [ResolvedAuth] with no headers or parameters.
  @override
  Future<ResolvedAuth> resolve(AuthContext context) async =>
      const ResolvedAuth.noAuth();
}

/// An auth request that is a one of any of the given auth requests.
@immutable
class OneOfAuth extends AuthRequest {
  const OneOfAuth(this.auths);

  /// The auth requests that are a one of.
  final List<AuthRequest> auths;

  /// Returns true if any of the auth requests have all the secrets.
  @override
  bool haveSecrets(String? Function(String name) getSecret) =>
      auths.any((e) => e.haveSecrets(getSecret));

  /// Returns the resolved auth for the first auth request that has all
  /// necessary secrets.
  @override
  Future<ResolvedAuth> resolve(AuthContext context) async {
    // Walk the auths in order, see if we have all secrets for any of them
    // if so, return the resolved auth for that auth.
    for (final auth in auths) {
      if (auth.haveSecrets(context.getSecret)) {
        return auth.resolve(context);
      }
    }
    // If we get here, we don't have all the secrets for any of the auths.
    throw MissingSecretsException(this);
  }
}

/// An auth request that is all of any of the given auth requests.
@immutable
class AllOfAuth extends AuthRequest {
  /// Create a new [AllOfAuth].
  const AllOfAuth(this.auths);

  /// The auth requests that are all of.
  final List<AuthRequest> auths;

  /// Returns true if all of the auth requests have all the secrets.
  @override
  bool haveSecrets(String? Function(String name) getSecret) =>
      auths.every((e) => e.haveSecrets(getSecret));

  /// Returns the resolved auth for the first auth request that has all
  /// necessary secrets.
  @override
  Future<ResolvedAuth> resolve(AuthContext context) async {
    var resolved = const ResolvedAuth.noAuth();
    for (final auth in auths) {
      resolved = resolved.merge(await auth.resolve(context));
    }
    return resolved;
  }
}

/// An auth request that requires a secret.
@immutable
abstract class SecretAuth extends AuthRequest {
  const SecretAuth({required this.secretName});

  /// The name of the secret.
  final String secretName;

  @override
  bool haveSecrets(String? Function(String name) getSecret) =>
      getSecret(secretName) != null;
}

/// An HTTP authentication scheme.
@immutable
class HttpAuth extends SecretAuth {
  /// Create a new HTTP authentication scheme.
  const HttpAuth({required this.scheme, required super.secretName});

  /// The scheme to use when sending the HTTP token.
  final String scheme;

  @override
  Future<ResolvedAuth> resolve(AuthContext context) async {
    final secret = context.getSecret(secretName);
    if (secret == null) {
      throw MissingSecretsException(this);
    }
    return ResolvedAuth(
      headers: {'Authorization': '$scheme $secret'},
      params: const {},
    );
  }
}

// Cookie is not yet supported.
enum ApiKeyLocation { query, header }

/// An API key authentication scheme.
@immutable
class ApiKeyAuth extends SecretAuth {
  const ApiKeyAuth({
    required this.name,
    required this.sendIn,
    required super.secretName,
  });

  /// The key name used when sending the API key.
  final String name;

  /// Where to send the API key.
  final ApiKeyLocation sendIn;

  @override
  Future<ResolvedAuth> resolve(AuthContext context) async {
    final secret = context.getSecret(secretName);
    if (secret == null) {
      throw MissingSecretsException(this);
    }
    return switch (sendIn) {
      ApiKeyLocation.header => ResolvedAuth(
        headers: {name: secret},
        params: const {},
      ),
      ApiKeyLocation.query => ResolvedAuth(
        headers: const {},
        params: {name: secret},
      ),
    };
  }
}
