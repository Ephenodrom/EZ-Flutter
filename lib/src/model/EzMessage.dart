import 'EzMessageType.dart';

///
/// Class that represents a message that can be displayed.
///
class EzMessage {
  /// The text to display
  final String text;

  /// The type of the message, influences the color of the message background
  final EzMessageType type;

  /// Defines if the message was displayed or not
  bool displayed = false;

  EzMessage(this.text, this.type);
}
