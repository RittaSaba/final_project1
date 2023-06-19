class SessionResponse {
  SessionResponse({
    required this.status,
    required this.sessions,
  });

  final String status;
  final List<Session> sessions;

  factory SessionResponse.fromJson(Map<String, dynamic> json){
    return SessionResponse(
      status: json["status"] ?? "",
      sessions: json["sessions"] == null ? [] : List<Session>.from(json["sessions"]!.map((x) => Session.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "sessions": sessions.map((x) => x?.toJson()).toList(),
  };

}

class Session {
  Session({
    required this.id,
    required this.number,
    required this.date,
    required this.description,
    required this.caseId,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final num number;
  final String date;
  final String description;
  final int caseId;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Session.fromJson(Map<String, dynamic> json){
    return Session(
      id: json["id"] ?? 0,
      number: json["number"] ?? 0,
      date: json["date"] ?? "",
      description: json["description"] ?? "",
      caseId: json["case_id"] ?? 0,
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,
    "date": date,
    "description": description,
    "case_id": caseId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };

}
