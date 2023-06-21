class TaskResponse {
  TaskResponse({
    required this.status,
    required this.tasks,
  });

  final String status;
  final List<Task> tasks;

  factory TaskResponse.fromJson(Map<String, dynamic> json){
    return TaskResponse(
      status: json["status"] ?? "",
      tasks: json["tasks"] == null ? [] : List<Task>.from(json["tasks"]!.map((x) => Task.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "tasks": tasks.map((x) => x?.toJson()).toList(),
  };

}

class Task {
  Task({
    required this.id,
    required this.name,
    required this.description,
   // required this.startDate,
    //required this.endDate,
    required this.status,
    required this.valueStatus,
    required this.priority,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  final int id;
  final String name;
  final String description;
  //final DateTime? startDate;
  //final DateTime? endDate;
  final String status;
  final num valueStatus;
  final String priority;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  factory Task.fromJson(Map<String, dynamic> json){
    return Task(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
    //  startDate: DateTime.tryParse(json["start_date"] ?? ""),
      //endDate: DateTime.tryParse(json["end_date"] ?? ""),
      status: json["Status"] ?? "",
      valueStatus: json["Value_Status"] ?? 0,
      priority: json["priority"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "Status": status,
    "Value_Status": valueStatus,
    "priority": priority,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };

}

class Pivot {
  Pivot({
    required this.userId,
    required this.taskId,
  });

  final int userId;
  final int taskId;

  factory Pivot.fromJson(Map<String, dynamic> json){
    return Pivot(
      userId: json["user_id"] ?? 0,
      taskId: json["task_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "task_id": taskId,
  };

}
