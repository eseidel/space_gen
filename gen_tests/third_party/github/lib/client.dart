import 'package:github/api.dart';

class GitHub {
  GitHub({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  ActionsApi get actions => ActionsApi(client);
  ActivityApi get activity => ActivityApi(client);
  AppsApi get apps => AppsApi(client);
  BillingApi get billing => BillingApi(client);
  CampaignsApi get campaigns => CampaignsApi(client);
  ChecksApi get checks => ChecksApi(client);
  ClassroomApi get classroom => ClassroomApi(client);
  CodeScanningApi get codeScanning => CodeScanningApi(client);
  CodeSecurityApi get codeSecurity => CodeSecurityApi(client);
  CodesOfConductApi get codesOfConduct => CodesOfConductApi(client);
  CodespacesApi get codespaces => CodespacesApi(client);
  CopilotApi get copilot => CopilotApi(client);
  CredentialsApi get credentials => CredentialsApi(client);
  DependabotApi get dependabot => DependabotApi(client);
  DependencyGraphApi get dependencyGraph => DependencyGraphApi(client);
  EmojisApi get emojis => EmojisApi(client);
  GistsApi get gists => GistsApi(client);
  GitApi get git => GitApi(client);
  GitignoreApi get gitignore => GitignoreApi(client);
  HostedComputeApi get hostedCompute => HostedComputeApi(client);
  InteractionsApi get interactions => InteractionsApi(client);
  IssuesApi get issues => IssuesApi(client);
  LicensesApi get licenses => LicensesApi(client);
  MarkdownApi get markdown => MarkdownApi(client);
  MetaApi get meta => MetaApi(client);
  MigrationsApi get migrations => MigrationsApi(client);
  OidcApi get oidc => OidcApi(client);
  OrgsApi get orgs => OrgsApi(client);
  PackagesApi get packages => PackagesApi(client);
  PrivateRegistriesApi get privateRegistries => PrivateRegistriesApi(client);
  ProjectsApi get projects => ProjectsApi(client);
  PullsApi get pulls => PullsApi(client);
  RateLimitApi get rateLimit => RateLimitApi(client);
  ReactionsApi get reactions => ReactionsApi(client);
  ReposApi get repos => ReposApi(client);
  SearchApi get search => SearchApi(client);
  SecretScanningApi get secretScanning => SecretScanningApi(client);
  SecurityAdvisoriesApi get securityAdvisories => SecurityAdvisoriesApi(client);
  TeamsApi get teams => TeamsApi(client);
  UsersApi get users => UsersApi(client);
}
