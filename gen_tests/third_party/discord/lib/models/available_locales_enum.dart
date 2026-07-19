enum AvailableLocalesEnum {
  /// The ar locale
  ar._('ar'),

  /// The bg locale
  bg._('bg'),

  /// The cs locale
  cs._('cs'),

  /// The da locale
  da._('da'),

  /// The de locale
  de._('de'),

  /// The el locale
  el._('el'),

  /// The en-GB locale
  enGB._('en-GB'),

  /// The en-US locale
  enUS._('en-US'),

  /// The es-419 locale
  es419._('es-419'),

  /// The es-ES locale
  esES._('es-ES'),

  /// The fi locale
  fi._('fi'),

  /// The fr locale
  fr._('fr'),

  /// The he locale
  he._('he'),

  /// The hi locale
  hi._('hi'),

  /// The hr locale
  hr._('hr'),

  /// The hu locale
  hu._('hu'),

  /// The id locale
  id._('id'),

  /// The it locale
  it._('it'),

  /// The ja locale
  ja._('ja'),

  /// The ko locale
  ko._('ko'),

  /// The lt locale
  lt._('lt'),

  /// The nl locale
  nl._('nl'),

  /// The no locale
  no._('no'),

  /// The pl locale
  pl._('pl'),

  /// The pt-BR locale
  ptBR._('pt-BR'),

  /// The ro locale
  ro._('ro'),

  /// The ru locale
  ru._('ru'),

  /// The sv-SE locale
  svSE._('sv-SE'),

  /// The th locale
  th._('th'),

  /// The tr locale
  tr._('tr'),

  /// The uk locale
  uk._('uk'),

  /// The vi locale
  vi._('vi'),

  /// The zh-CN locale
  zhCN._('zh-CN'),

  /// The zh-TW locale
  zhTW._('zh-TW');

  const AvailableLocalesEnum._(this.value);

  /// Creates a AvailableLocalesEnum from a json value.
  factory AvailableLocalesEnum.fromJson(String json) {
    return AvailableLocalesEnum.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown AvailableLocalesEnum value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static AvailableLocalesEnum? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return AvailableLocalesEnum.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
