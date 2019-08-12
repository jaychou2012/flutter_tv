class TimeUtils {
  static String getTime() {
    DateTime dateTime = DateTime.now();
    return '${dateTime.year}年${dateTime.month}月${dateTime.day}日 ${dateTime.hour}:${dateTime.minute}';
  }
}
