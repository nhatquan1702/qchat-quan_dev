import 'package:chat_app/view/component/enum/time_enum.dart';

class FormatTime {
  static String showTimeFormat(DateTime time, TimeEnum type) {
    String convertNumber(int value) {
      return value < 10 ? "0$value" : "$value";
    }

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

    switch (type) {
      case TimeEnum.listUser:
        String showTimeListUser = '';
        if (diffSeconds < 60) {
          showTimeListUser = '$diffSeconds giây trước';
        } else if (diffSeconds > 59 && diffMinutes < 60) {
          showTimeListUser = '$diffMinutes phút trước';
        } else if (diffMinutes > 59 && diffHours < 25) {
          showTimeListUser = '$diffHours giờ trước';
        } else if (diffHours > 24 && diffDays < 31) {
          showTimeListUser = '$diffDays ngày trước';
        } else if (diffDays > 30) {
          showTimeListUser =
              '${convertNumber(time.hour)}:${convertNumber(time.minute)} ${convertNumber(time.day)}/${convertNumber(time.month)}/${convertNumber(time.year)}';
        }
        return showTimeListUser;
      case TimeEnum.listChat:
        String showTimeListUser = '';
        if (diffSeconds < 60) {
          showTimeListUser = '$diffSeconds giây trước';
        } else if (diffSeconds > 59 && diffMinutes < 60) {
          showTimeListUser = '$diffMinutes phút trước';
        } else if (diffMinutes > 59 && diffHours < 25) {
          showTimeListUser = '$diffHours giờ trước';
        } else if (diffHours > 24 && diffDays < 8) {
          showTimeListUser = '$diffDays ngày trước';
        } else if (diffDays > 7) {
          showTimeListUser =
              '${convertNumber(time.hour)}:${convertNumber(time.minute)} ${convertNumber(time.day)}/${convertNumber(time.month)}/${convertNumber(time.year)}';
        }
        return showTimeListUser;
      case TimeEnum.detailChat:
        String showTimeListUser = '';
        showTimeListUser =
            '${convertNumber(time.hour)}:${convertNumber(time.minute)} ${convertNumber(time.day)}/${convertNumber(time.month)}/${convertNumber(time.year)}';
        return showTimeListUser;
    }
  }
}
