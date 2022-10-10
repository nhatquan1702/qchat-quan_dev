enum MessageEnum {
  text('text'),
  image('image'),
  audio('audio'),
  video('video'),
  gif('gif'),
  voice('voice'),
  emoji('emoji');

  const MessageEnum(this.type);
  final String type;
}

// Using an extension
// Enhanced enums

extension ConvertMessage on String {
  MessageEnum toEnum() {
    switch (this) {
      case 'audio':
        return MessageEnum.audio;
      case 'image':
        return MessageEnum.image;
      case 'text':
        return MessageEnum.text;
      case 'gif':
        return MessageEnum.gif;
      case 'video':
        return MessageEnum.video;
      case 'voice':
        return MessageEnum.voice;
      case 'emoji':
        return MessageEnum.emoji;
      default:
        return MessageEnum.text;
    }
  }
}