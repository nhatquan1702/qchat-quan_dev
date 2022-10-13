enum TimeEnum {
  listUser('listUser'),
  listChat('listChat'),
  detailChat('detailChat');

  const TimeEnum(this.type);
  final String type;
}

extension ConvertTime on String {
  TimeEnum toEnum() {
    switch (this) {
      case 'listUser':
        return TimeEnum.listUser;
      case 'listChat':
        return TimeEnum.listChat;
      case 'detailChat':
        return TimeEnum.detailChat;
      default:
        return TimeEnum.detailChat;
    }
  }
}
