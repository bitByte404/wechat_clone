class TimeUtils {
  static String formatTimestamp(String timestamp) {
    DateTime now = DateTime.now();
    DateTime date = DateTime.parse(timestamp);
    Duration difference = now.difference(date);

    if (difference.inDays == 0) {
      return '${date.hour}:${date.minute.toString().padLeft(2, '0')}'; // Today, show specific time
    } else if (difference.inDays == 1) {
      return '昨天';
    } else if (difference.inDays < 7) {
      const List<String> weekdays = ['一', '二', '三', '四', '五', '六', '日'];
      return '周${weekdays[date.weekday - 1]}';
    } else {
      return '${date.month}月${date.day}日';
    }
  }
}
