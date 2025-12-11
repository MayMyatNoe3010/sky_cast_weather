class Weather {
  final int? id;
  final String title;
  final String? note;
  final String startTime;
  final String endTime;
  final int reminderTime;
  final bool isComplete;
  final bool isRepeated;

  Weather({
    this.id,
    required this.title,
    this.note,
    required this.startTime,
    required this.endTime,
    required this.reminderTime,
    this.isComplete = false,
    this.isRepeated = false,
  });

  Weather copyWith({
    int? id,
    String? title,
    String? note,
    String? startTime,
    String? endTime,
    int? reminderTime,
    bool? isComplete,
    bool? isRepeated,
  }) {
    return Weather(
      id: id ?? this.id,
      title: title ?? this.title,
      note: note ?? this.note,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      reminderTime: reminderTime ?? this.reminderTime,
      isComplete: isComplete ?? this.isComplete,
      isRepeated: isRepeated ?? this.isRepeated,
    );
  }
}
