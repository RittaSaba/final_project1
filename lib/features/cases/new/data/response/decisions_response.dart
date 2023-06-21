class DecisionsResponse {
  DecisionsResponse({
    required this.status,
    required this.decisions,
  });

  final String status;
  final List<Decision> decisions;

  factory DecisionsResponse.fromJson(Map<String, dynamic> json){
    return DecisionsResponse(
      status: json["status"] ?? "",
      decisions: json["decisions"] == null ? [] : List<Decision>.from(json["decisions"]!.map((x) => Decision.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "decisions": decisions.map((x) => x?.toJson()).toList(),
  };

}

class Decision {
  Decision({
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
  final DateTime? date;
  final String description;
  final int caseId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Decision.fromJson(Map<String, dynamic> json){
    return Decision(
      id: json["id"] ?? 0,
      number: json["number"] ?? 0,
      date: DateTime.tryParse(json["date"] ?? ""),
      description: json["description"] ?? "",
      caseId: json["case_id"] ?? 0,
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "number": number,

    "description": description,
    "case_id": caseId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };

}
