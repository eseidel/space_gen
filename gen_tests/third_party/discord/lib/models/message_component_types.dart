enum MessageComponentTypes {
  /// Container for other components
  actionRow._(1),

  /// Button object
  button._(2),

  /// Select menu for picking from defined text options
  stringSelect._(3),

  /// Text input object
  textInput._(4),

  /// Select menu for users
  userSelect._(5),

  /// Select menu for roles
  roleSelect._(6),

  /// Select menu for mentionables (users and roles)
  mentionableSelect._(7),

  /// Select menu for channels
  channelSelect._(8),

  /// Section component
  section._(9),

  /// Text component
  textDisplay._(10),

  /// Thumbnail component
  thumbnail._(11),

  /// Media gallery component
  mediaGallery._(12),

  /// File component
  file._(13),

  /// Separator component
  separator._(14),

  /// Container component
  container._(17),

  /// Label component
  label._(18),

  /// File upload component
  fileUpload._(19),

  /// Radio group component
  radioGroup._(21),

  /// Checkbox group component
  checkboxGroup._(22),

  /// Checkbox component
  checkbox._(23);

  const MessageComponentTypes._(this.value);

  /// Creates a MessageComponentTypes from a json value.
  factory MessageComponentTypes.fromJson(int json) {
    return MessageComponentTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown MessageComponentTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MessageComponentTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return MessageComponentTypes.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
