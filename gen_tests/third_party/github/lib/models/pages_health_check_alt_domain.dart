import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PagesHealthCheckAltDomain {
  const PagesHealthCheckAltDomain({
    this.host,
    this.uri,
    this.nameservers,
    this.dnsResolves,
    this.isProxied,
    this.isCloudflareIp,
    this.isFastlyIp,
    this.isOldIpAddress,
    this.isARecord,
    this.hasCnameRecord,
    this.hasMxRecordsPresent,
    this.isValidDomain,
    this.isApexDomain,
    this.shouldBeARecord,
    this.isCnameToGithubUserDomain,
    this.isCnameToPagesDotGithubDotCom,
    this.isCnameToFastly,
    this.isPointedToGithubPagesIp,
    this.isNonGithubPagesIpPresent,
    this.isPagesDomain,
    this.isServedByPages,
    this.isValid,
    this.reason,
    this.respondsToHttps,
    this.enforcesHttps,
    this.httpsError,
    this.isHttpsEligible,
    this.caaError,
  });

  /// Converts a `Map<String, dynamic>` to a [PagesHealthCheckAltDomain].
  factory PagesHealthCheckAltDomain.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PagesHealthCheckAltDomain',
      json,
      () => PagesHealthCheckAltDomain(
        host: json['host'] as String?,
        uri: json['uri'] as String?,
        nameservers: json['nameservers'] as String?,
        dnsResolves: json['dns_resolves'] as bool?,
        isProxied: json['is_proxied'] as bool?,
        isCloudflareIp: json['is_cloudflare_ip'] as bool?,
        isFastlyIp: json['is_fastly_ip'] as bool?,
        isOldIpAddress: json['is_old_ip_address'] as bool?,
        isARecord: json['is_a_record'] as bool?,
        hasCnameRecord: json['has_cname_record'] as bool?,
        hasMxRecordsPresent: json['has_mx_records_present'] as bool?,
        isValidDomain: json['is_valid_domain'] as bool?,
        isApexDomain: json['is_apex_domain'] as bool?,
        shouldBeARecord: json['should_be_a_record'] as bool?,
        isCnameToGithubUserDomain:
            json['is_cname_to_github_user_domain'] as bool?,
        isCnameToPagesDotGithubDotCom:
            json['is_cname_to_pages_dot_github_dot_com'] as bool?,
        isCnameToFastly: json['is_cname_to_fastly'] as bool?,
        isPointedToGithubPagesIp:
            json['is_pointed_to_github_pages_ip'] as bool?,
        isNonGithubPagesIpPresent:
            json['is_non_github_pages_ip_present'] as bool?,
        isPagesDomain: json['is_pages_domain'] as bool?,
        isServedByPages: json['is_served_by_pages'] as bool?,
        isValid: json['is_valid'] as bool?,
        reason: json['reason'] as String?,
        respondsToHttps: json['responds_to_https'] as bool?,
        enforcesHttps: json['enforces_https'] as bool?,
        httpsError: json['https_error'] as String?,
        isHttpsEligible: json['is_https_eligible'] as bool?,
        caaError: json['caa_error'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PagesHealthCheckAltDomain? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PagesHealthCheckAltDomain.fromJson(json);
  }

  final String? host;
  final String? uri;
  final String? nameservers;
  final bool? dnsResolves;
  final bool? isProxied;
  final bool? isCloudflareIp;
  final bool? isFastlyIp;
  final bool? isOldIpAddress;
  final bool? isARecord;
  final bool? hasCnameRecord;
  final bool? hasMxRecordsPresent;
  final bool? isValidDomain;
  final bool? isApexDomain;
  final bool? shouldBeARecord;
  final bool? isCnameToGithubUserDomain;
  final bool? isCnameToPagesDotGithubDotCom;
  final bool? isCnameToFastly;
  final bool? isPointedToGithubPagesIp;
  final bool? isNonGithubPagesIpPresent;
  final bool? isPagesDomain;
  final bool? isServedByPages;
  final bool? isValid;
  final String? reason;
  final bool? respondsToHttps;
  final bool? enforcesHttps;
  final String? httpsError;
  final bool? isHttpsEligible;
  final String? caaError;

  /// Converts a [PagesHealthCheckAltDomain] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'host': ?host,
      'uri': ?uri,
      'nameservers': ?nameservers,
      'dns_resolves': ?dnsResolves,
      'is_proxied': isProxied,
      'is_cloudflare_ip': isCloudflareIp,
      'is_fastly_ip': isFastlyIp,
      'is_old_ip_address': isOldIpAddress,
      'is_a_record': isARecord,
      'has_cname_record': hasCnameRecord,
      'has_mx_records_present': hasMxRecordsPresent,
      'is_valid_domain': ?isValidDomain,
      'is_apex_domain': ?isApexDomain,
      'should_be_a_record': shouldBeARecord,
      'is_cname_to_github_user_domain': isCnameToGithubUserDomain,
      'is_cname_to_pages_dot_github_dot_com': isCnameToPagesDotGithubDotCom,
      'is_cname_to_fastly': isCnameToFastly,
      'is_pointed_to_github_pages_ip': isPointedToGithubPagesIp,
      'is_non_github_pages_ip_present': isNonGithubPagesIpPresent,
      'is_pages_domain': ?isPagesDomain,
      'is_served_by_pages': isServedByPages,
      'is_valid': ?isValid,
      'reason': reason,
      'responds_to_https': ?respondsToHttps,
      'enforces_https': ?enforcesHttps,
      'https_error': httpsError,
      'is_https_eligible': isHttpsEligible,
      'caa_error': caaError,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    host,
    uri,
    nameservers,
    dnsResolves,
    isProxied,
    isCloudflareIp,
    isFastlyIp,
    isOldIpAddress,
    isARecord,
    hasCnameRecord,
    hasMxRecordsPresent,
    isValidDomain,
    isApexDomain,
    shouldBeARecord,
    isCnameToGithubUserDomain,
    isCnameToPagesDotGithubDotCom,
    isCnameToFastly,
    isPointedToGithubPagesIp,
    isNonGithubPagesIpPresent,
    isPagesDomain,
    isServedByPages,
    isValid,
    reason,
    respondsToHttps,
    enforcesHttps,
    httpsError,
    isHttpsEligible,
    caaError,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PagesHealthCheckAltDomain &&
        host == other.host &&
        uri == other.uri &&
        nameservers == other.nameservers &&
        dnsResolves == other.dnsResolves &&
        isProxied == other.isProxied &&
        isCloudflareIp == other.isCloudflareIp &&
        isFastlyIp == other.isFastlyIp &&
        isOldIpAddress == other.isOldIpAddress &&
        isARecord == other.isARecord &&
        hasCnameRecord == other.hasCnameRecord &&
        hasMxRecordsPresent == other.hasMxRecordsPresent &&
        isValidDomain == other.isValidDomain &&
        isApexDomain == other.isApexDomain &&
        shouldBeARecord == other.shouldBeARecord &&
        isCnameToGithubUserDomain == other.isCnameToGithubUserDomain &&
        isCnameToPagesDotGithubDotCom == other.isCnameToPagesDotGithubDotCom &&
        isCnameToFastly == other.isCnameToFastly &&
        isPointedToGithubPagesIp == other.isPointedToGithubPagesIp &&
        isNonGithubPagesIpPresent == other.isNonGithubPagesIpPresent &&
        isPagesDomain == other.isPagesDomain &&
        isServedByPages == other.isServedByPages &&
        isValid == other.isValid &&
        reason == other.reason &&
        respondsToHttps == other.respondsToHttps &&
        enforcesHttps == other.enforcesHttps &&
        httpsError == other.httpsError &&
        isHttpsEligible == other.isHttpsEligible &&
        caaError == other.caaError;
  }
}
