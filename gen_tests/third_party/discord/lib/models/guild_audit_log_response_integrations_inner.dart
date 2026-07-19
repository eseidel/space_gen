sealed class GuildAuditLogResponseIntegrationsInner {
  static GuildAuditLogResponseIntegrationsInner fromJson(dynamic jsonArg) {
    // Determine which schema to use based on the json.
    // TODO(eseidel): Implement this.
    throw UnimplementedError('GuildAuditLogResponseIntegrationsInner.fromJson');
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildAuditLogResponseIntegrationsInner? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return GuildAuditLogResponseIntegrationsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}
