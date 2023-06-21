enum Repeat { never, daily, weekly, monthly }

const remindList = [5, 12, 15, 20];

class LocalTask {
  LocalTask({
    this.creationTime,
    this.startTime,
    this.endTime,
    this.id,
    required this.title,
    required this.note,
    this.isCompleted,
    this.remind,
    this.userId,
    this.repeat,
  }) {
    startTime ??= DateTime.now();
    endTime ??= DateTime.now();
  }

  DateTime? creationTime;
  DateTime? startTime;
  DateTime? endTime;
  int? id;
  int? userId;
  String title;
  String note;
  bool? isCompleted;
  int? remind;
  Repeat? repeat;

  LocalTask copyWith({
    DateTime? creationTime,
    DateTime? startTime,
    DateTime? endTime,
    int? id,
    required String title,
    required String note,
    bool? isCompleted,
    int? remind,
    Repeat? repeat,
  }) {
    return LocalTask(
      creationTime: creationTime ?? this.creationTime,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      id: id ?? this.id,
      title: title,
      note: note,
      isCompleted: isCompleted ?? this.isCompleted,
      remind: remind ?? this.remind,
      repeat: repeat ?? this.repeat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "creationTime": DateTime.now().toIso8601String(),
      "startTime": startTime?.toIso8601String(),
      "endTime": endTime?.toIso8601String(),
      'id': id,
      'userId': userId,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'remind': remind,
      'repeat': repeat?.index,
    }..removeWhere((key, value) => value == null);
  }

  factory LocalTask.fromMap(Map<String, dynamic> map) {
    return LocalTask(
      creationTime: DateTime.tryParse(map["creationTime"] ?? ""),
      startTime: DateTime.tryParse(map["startTime"] ?? ""),
      endTime: DateTime.tryParse(map["endTime"] ?? ""),
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      note: map['note'] ?? '',
      userId: map['userId'] ?? 0,
      isCompleted: map['isCompleted'] ?? false,
      remind: map['remind'] ?? 0,
      repeat: Repeat.values[map['repeat'] ?? 0],
    );
  }
}
