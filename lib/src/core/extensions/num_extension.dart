extension NumExtension on num {
  String addLeadingZero() {
    return toString().padLeft(2, '0');
  }

  String durationToString() {
    var d = Duration(minutes: toInt());
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}H : ${parts[1].padLeft(2, '0')}M';
  }

  String toDayName() {
    switch (toInt()) {
      case 1:
        return 'Saturday';
      case 2:
        return 'Sunday';
      case 3:
        return 'Monday';
      case 4:
        return 'Tuesday';
      case 5:
        return 'Wednesday';
      case 6:
        return 'Thursday';
      case 7:
        return 'Friday';
      default:
        return '';
    }
  }
}
