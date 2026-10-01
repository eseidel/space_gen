// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GuildIncidentsDataResponse {
  const GuildIncidentsDataResponse({
    required this.invitesDisabledUntil,
    required this.dmsDisabledUntil,
  });

  /// Converts a `Map<String, dynamic>` to a [GuildIncidentsDataResponse].
  factory GuildIncidentsDataResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GuildIncidentsDataResponse',
      json,
      () => GuildIncidentsDataResponse(
        invitesDisabledUntil: maybeParseDateTime(
          checkedKey(json, 'invites_disabled_until') as String?,
        ),
        dmsDisabledUntil: maybeParseDateTime(
          checkedKey(json, 'dms_disabled_until') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GuildIncidentsDataResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GuildIncidentsDataResponse.fromJson(json);
  }

  final DateTime? invitesDisabledUntil;
  final DateTime? dmsDisabledUntil;

  /// Converts a [GuildIncidentsDataResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'invites_disabled_until': invitesDisabledUntil?.toIso8601String(),
      'dms_disabled_until': dmsDisabledUntil?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([invitesDisabledUntil, dmsDisabledUntil]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GuildIncidentsDataResponse &&
        invitesDisabledUntil == other.invitesDisabledUntil &&
        dmsDisabledUntil == other.dmsDisabledUntil;
  }
}
