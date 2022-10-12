class FormatTime {
  static String showTimeFormat(DateTime time) {
    int timeBetween(DateTime from, DateTime to) {
      from = DateTime(
        from.year,
        from.month,
        from.day,
        from.hour,
        from.minute,
        from.second,
      );
      to = DateTime(
        to.year,
        to.month,
        to.day,
        to.hour,
        to.minute,
        to.second,
      );
      return (to.difference(from).inMilliseconds);
    }

    final timeCurrent = DateTime.now();
    final diff = timeBetween(time, timeCurrent);

    //int diff7 = diff -(7*60*60*1000); //múi giờ VN

    int diffSeconds = diff ~/ 1000;
    int diffMinutes = diff ~/ (60 * 1000);
    int diffHours = diff ~/ (60 * 60 * 1000);
    int diffDays = diff ~/ (60 * 60 * 1000 * 24);

    String showTime = '';
    if (diffSeconds < 60) {
      showTime = '$diffSeconds giây trước';
    } else if (diffMinutes > 60 && diffMinutes < 60) {
      showTime = '$diffMinutes phút trước';
    } else if (diffMinutes > 60 && diffHours < 24) {
      showTime = '$diffHours giờ trước';
    } else if (diffHours > 24 && diffDays < 30) {
      showTime = '$diffDays ngày trước';
    } else if (diffDays > 30) {
      showTime =
          '${time.hour}:${time.minute} ${time.day}/${time.month}/${time.year}';
    }
    return showTime;
  }
}
