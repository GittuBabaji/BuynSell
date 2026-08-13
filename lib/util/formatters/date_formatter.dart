/// Utility class for formatting dates, times, relative timestamps, and chat timestamps.
class DateFormatter {
  // Private constructor to prevent instantiation
  DateFormatter._();

  static const List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
  ];

  static const List<String> _fullMonths = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  /// Formats a [DateTime] into a formatted date string (default pattern: 'dd MMM yyyy').
  static String formatDate(DateTime dateTime, {String format = 'dd MMM yyyy'}) {
    final day = dateTime.day.toString().padLeft(2, '0');
    final monthShort = _months[dateTime.month - 1];
    final monthFull = _fullMonths[dateTime.month - 1];
    final monthNum = dateTime.month.toString().padLeft(2, '0');
    final year = dateTime.year.toString();

    String result = format;
    result = result.replaceAll('dd', day);
    result = result.replaceAll('MMMM', monthFull);
    result = result.replaceAll('MMM', monthShort);
    result = result.replaceAll('MM', monthNum);
    result = result.replaceAll('yyyy', year);

    return result;
  }

  /// Formats a [DateTime] into a 12-hour time string (e.g. '10:30 AM').
  static String formatTime(DateTime dateTime) {
    final hour = dateTime.hour == 0 || dateTime.hour == 12 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  /// Formats a [DateTime] into a human-readable relative time (e.g. 'Just now', '2 hours ago').
  static String formatRelative(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      final mins = difference.inMinutes;
      return '$mins ${mins == 1 ? 'min' : 'mins'} ago';
    } else if (difference.inHours < 24) {
      final hours = difference.inHours;
      return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days ${days == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    }
  }

  /// Formats a [DateTime] for chat timestamps (e.g. '10:30 AM', 'Yesterday', or '12/08/2026').
  static String formatChatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (dateToCheck.isAtSameMomentAs(today)) {
      return formatTime(dateTime);
    } else if (dateToCheck.isAtSameMomentAs(yesterday)) {
      return 'Yesterday';
    } else {
      return formatDate(dateTime, format: 'dd/MM/yyyy');
    }
  }

  // TODO: Add support for custom locale date formats and timezones
}
