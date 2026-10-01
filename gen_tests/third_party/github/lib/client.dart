import 'package:github/api.dart';

/// The API client: one property per group of endpoints, all sharing
/// [client].
class GitHub {
  /// Creates the client, sending requests through [client] or, when null,
  /// a default [ApiClient].
  GitHub({ApiClient? client}) : client = client ?? ApiClient();

  /// The client requests are sent through.
  final ApiClient client;

  /// The [ActionsApi] endpoints.
  ActionsApi get actions => ActionsApi(client);

  /// The [ActivityApi] endpoints.
  ActivityApi get activity => ActivityApi(client);

  /// The [AppsApi] endpoints.
  AppsApi get apps => AppsApi(client);

  /// The [BillingApi] endpoints.
  BillingApi get billing => BillingApi(client);

  /// The [CampaignsApi] endpoints.
  CampaignsApi get campaigns => CampaignsApi(client);

  /// The [ChecksApi] endpoints.
  ChecksApi get checks => ChecksApi(client);

  /// The [ClassroomApi] endpoints.
  ClassroomApi get classroom => ClassroomApi(client);

  /// The [CodeScanningApi] endpoints.
  CodeScanningApi get codeScanning => CodeScanningApi(client);

  /// The [CodeSecurityApi] endpoints.
  CodeSecurityApi get codeSecurity => CodeSecurityApi(client);

  /// The [CodesOfConductApi] endpoints.
  CodesOfConductApi get codesOfConduct => CodesOfConductApi(client);

  /// The [CodespacesApi] endpoints.
  CodespacesApi get codespaces => CodespacesApi(client);

  /// The [CopilotApi] endpoints.
  CopilotApi get copilot => CopilotApi(client);

  /// The [CredentialsApi] endpoints.
  CredentialsApi get credentials => CredentialsApi(client);

  /// The [DependabotApi] endpoints.
  DependabotApi get dependabot => DependabotApi(client);

  /// The [DependencyGraphApi] endpoints.
  DependencyGraphApi get dependencyGraph => DependencyGraphApi(client);

  /// The [EmojisApi] endpoints.
  EmojisApi get emojis => EmojisApi(client);

  /// The [GistsApi] endpoints.
  GistsApi get gists => GistsApi(client);

  /// The [GitApi] endpoints.
  GitApi get git => GitApi(client);

  /// The [GitignoreApi] endpoints.
  GitignoreApi get gitignore => GitignoreApi(client);

  /// The [HostedComputeApi] endpoints.
  HostedComputeApi get hostedCompute => HostedComputeApi(client);

  /// The [InteractionsApi] endpoints.
  InteractionsApi get interactions => InteractionsApi(client);

  /// The [IssuesApi] endpoints.
  IssuesApi get issues => IssuesApi(client);

  /// The [LicensesApi] endpoints.
  LicensesApi get licenses => LicensesApi(client);

  /// The [MarkdownApi] endpoints.
  MarkdownApi get markdown => MarkdownApi(client);

  /// The [MetaApi] endpoints.
  MetaApi get meta => MetaApi(client);

  /// The [MigrationsApi] endpoints.
  MigrationsApi get migrations => MigrationsApi(client);

  /// The [OidcApi] endpoints.
  OidcApi get oidc => OidcApi(client);

  /// The [OrgsApi] endpoints.
  OrgsApi get orgs => OrgsApi(client);

  /// The [PackagesApi] endpoints.
  PackagesApi get packages => PackagesApi(client);

  /// The [PrivateRegistriesApi] endpoints.
  PrivateRegistriesApi get privateRegistries => PrivateRegistriesApi(client);

  /// The [ProjectsApi] endpoints.
  ProjectsApi get projects => ProjectsApi(client);

  /// The [PullsApi] endpoints.
  PullsApi get pulls => PullsApi(client);

  /// The [RateLimitApi] endpoints.
  RateLimitApi get rateLimit => RateLimitApi(client);

  /// The [ReactionsApi] endpoints.
  ReactionsApi get reactions => ReactionsApi(client);

  /// The [ReposApi] endpoints.
  ReposApi get repos => ReposApi(client);

  /// The [SearchApi] endpoints.
  SearchApi get search => SearchApi(client);

  /// The [SecretScanningApi] endpoints.
  SecretScanningApi get secretScanning => SecretScanningApi(client);

  /// The [SecurityAdvisoriesApi] endpoints.
  SecurityAdvisoriesApi get securityAdvisories => SecurityAdvisoriesApi(client);

  /// The [TeamsApi] endpoints.
  TeamsApi get teams => TeamsApi(client);

  /// The [UsersApi] endpoints.
  UsersApi get users => UsersApi(client);
}
