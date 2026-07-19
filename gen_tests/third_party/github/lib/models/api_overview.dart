import 'package:github/model_helpers.dart';
import 'package:github/models/api_overview_domains.dart';
import 'package:github/models/api_overview_ssh_key_fingerprints.dart';
import 'package:meta/meta.dart';

/// {@template api_overview}
/// Api Overview
/// Api Overview
/// {@endtemplate}
@immutable
class ApiOverview {
  /// {@macro api_overview}
  const ApiOverview({
    required this.verifiablePasswordAuthentication,
    this.sshKeyFingerprints,
    this.sshKeys,
    this.hooks,
    this.githubEnterpriseImporter,
    this.web,
    this.api,
    this.git,
    this.packages,
    this.pages,
    this.importer,
    this.actions,
    this.actionsMacos,
    this.codespaces,
    this.dependabot,
    this.copilot,
    this.domains,
  });

  /// Converts a `Map<String, dynamic>` to an [ApiOverview].
  factory ApiOverview.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ApiOverview',
      json,
      () => ApiOverview(
        verifiablePasswordAuthentication:
            json['verifiable_password_authentication'] as bool,
        sshKeyFingerprints: ApiOverviewSshKeyFingerprints.maybeFromJson(
          json['ssh_key_fingerprints'] as Map<String, dynamic>?,
        ),
        sshKeys: (json['ssh_keys'] as List?)?.cast<String>(),
        hooks: (json['hooks'] as List?)?.cast<String>(),
        githubEnterpriseImporter: (json['github_enterprise_importer'] as List?)
            ?.cast<String>(),
        web: (json['web'] as List?)?.cast<String>(),
        api: (json['api'] as List?)?.cast<String>(),
        git: (json['git'] as List?)?.cast<String>(),
        packages: (json['packages'] as List?)?.cast<String>(),
        pages: (json['pages'] as List?)?.cast<String>(),
        importer: (json['importer'] as List?)?.cast<String>(),
        actions: (json['actions'] as List?)?.cast<String>(),
        actionsMacos: (json['actions_macos'] as List?)?.cast<String>(),
        codespaces: (json['codespaces'] as List?)?.cast<String>(),
        dependabot: (json['dependabot'] as List?)?.cast<String>(),
        copilot: (json['copilot'] as List?)?.cast<String>(),
        domains: ApiOverviewDomains.maybeFromJson(
          json['domains'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ApiOverview? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ApiOverview.fromJson(json);
  }

  /// Example: `true`
  final bool verifiablePasswordAuthentication;
  final ApiOverviewSshKeyFingerprints? sshKeyFingerprints;

  /// Example: `'ssh-ed25519 ABCDEFGHIJKLMNOPQRSTUVWXYZ'`
  final List<String>? sshKeys;

  /// Example: `'192.0.2.1'`
  final List<String>? hooks;

  /// Example: `'192.0.2.1'`
  final List<String>? githubEnterpriseImporter;

  /// Example: `'192.0.2.1'`
  final List<String>? web;

  /// Example: `'192.0.2.1'`
  final List<String>? api;

  /// Example: `'192.0.2.1'`
  final List<String>? git;

  /// Example: `'192.0.2.1'`
  final List<String>? packages;

  /// Example: `'192.0.2.1'`
  final List<String>? pages;

  /// Example: `'192.0.2.1'`
  final List<String>? importer;

  /// Example: `'192.0.2.1'`
  final List<String>? actions;

  /// Example: `'192.0.2.1'`
  final List<String>? actionsMacos;

  /// Example: `'192.0.2.1'`
  final List<String>? codespaces;

  /// Example: `'192.0.2.1'`
  final List<String>? dependabot;

  /// Example: `'192.0.2.1'`
  final List<String>? copilot;
  final ApiOverviewDomains? domains;

  /// Converts an [ApiOverview] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'verifiable_password_authentication': verifiablePasswordAuthentication,
      if (sshKeyFingerprints != null)
        'ssh_key_fingerprints': sshKeyFingerprints?.toJson(),
      if (sshKeys != null) 'ssh_keys': sshKeys,
      if (hooks != null) 'hooks': hooks,
      if (githubEnterpriseImporter != null)
        'github_enterprise_importer': githubEnterpriseImporter,
      if (web != null) 'web': web,
      if (api != null) 'api': api,
      if (git != null) 'git': git,
      if (packages != null) 'packages': packages,
      if (pages != null) 'pages': pages,
      if (importer != null) 'importer': importer,
      if (actions != null) 'actions': actions,
      if (actionsMacos != null) 'actions_macos': actionsMacos,
      if (codespaces != null) 'codespaces': codespaces,
      if (dependabot != null) 'dependabot': dependabot,
      if (copilot != null) 'copilot': copilot,
      if (domains != null) 'domains': domains?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    verifiablePasswordAuthentication,
    sshKeyFingerprints,
    listHash(sshKeys),
    listHash(hooks),
    listHash(githubEnterpriseImporter),
    listHash(web),
    listHash(api),
    listHash(git),
    listHash(packages),
    listHash(pages),
    listHash(importer),
    listHash(actions),
    listHash(actionsMacos),
    listHash(codespaces),
    listHash(dependabot),
    listHash(copilot),
    domains,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ApiOverview &&
        verifiablePasswordAuthentication ==
            other.verifiablePasswordAuthentication &&
        sshKeyFingerprints == other.sshKeyFingerprints &&
        listsEqual(sshKeys, other.sshKeys) &&
        listsEqual(hooks, other.hooks) &&
        listsEqual(githubEnterpriseImporter, other.githubEnterpriseImporter) &&
        listsEqual(web, other.web) &&
        listsEqual(api, other.api) &&
        listsEqual(git, other.git) &&
        listsEqual(packages, other.packages) &&
        listsEqual(pages, other.pages) &&
        listsEqual(importer, other.importer) &&
        listsEqual(actions, other.actions) &&
        listsEqual(actionsMacos, other.actionsMacos) &&
        listsEqual(codespaces, other.codespaces) &&
        listsEqual(dependabot, other.dependabot) &&
        listsEqual(copilot, other.copilot) &&
        domains == other.domains;
  }
}
