class CasesResponse {
  CasesResponse({
    required this.status,
    required this.cases,
  });

  final String status;
  final List<Case> cases;

  factory CasesResponse.fromJson(Map<String, dynamic> json){
    return CasesResponse(
      status: json["status"] ?? "",
      cases: json["cases"] == null ? [] : List<Case>.from(json["cases"]!.map((x) => Case.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "cases": cases.map((x) => x?.toJson()).toList(),
  };

}

class Case {
  Case({
    required this.id,
    required this.title,
    required this.status,
    required this.valueStatus,
    required this.facts,
    required this.claim,
    required this.caseRoom,
    required this.courtId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
    required this.lawyers,
    required this.clients,
  });

  final int id;
  final String title;
  final String status;
  final num valueStatus;
  final String facts;
  final String claim;
  final String caseRoom;
  final int courtId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;
  final List<Client> lawyers;
  final List<Client> clients;

  factory Case.fromJson(Map<String, dynamic> json){
    return Case(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      status: json["Status"] ?? "",
      valueStatus: json["Value_Status"] ?? 0,
      facts: json["facts"] ?? "",
      claim: json["claim"] ?? "",
      caseRoom: json["case_room"] ?? "",
      courtId: json["court_id"] ?? 0,
      deletedAt: json["deleted_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      lawyers: json["lawyers"] == null ? [] : List<Client>.from(json["lawyers"]!.map((x) => Client.fromJson(x))),
      clients: json["clients"] == null ? [] : List<Client>.from(json["clients"]!.map((x) => Client.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "Status": status,
    "Value_Status": valueStatus,
    "facts": facts,
    "claim": claim,
    "case_room": caseRoom,
    "court_id": courtId,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
    "lawyers": lawyers.map((x) => x?.toJson()).toList(),
    "clients": clients.map((x) => x?.toJson()).toList(),
  };

}

class Client {
  Client({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.motherName,
    required this.fatherName,
    required this.phone,
    required this.currentAddress,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.email,
    required this.emailVerifiedAt,
    required this.status,
    required this.roleName,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String motherName;
  final String fatherName;
  final String phone;
  final String currentAddress;
  final DateTime? dateOfBirth;
  final String placeOfBirth;
  final dynamic email;
  final dynamic emailVerifiedAt;
  final String status;
  final String roleName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  factory Client.fromJson(Map<String, dynamic> json){
    return Client(
      id: json["id"] ?? 0,
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      motherName: json["mother_name"] ?? "",
      fatherName: json["father_name"] ?? "",
      phone: json["phone"] ?? "",
      currentAddress: json["current_address"] ?? "",
      dateOfBirth: DateTime.tryParse(json["date_of_birth"] ?? ""),
      placeOfBirth: json["place_of_birth"] ?? "",
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      status: json["status"] ?? "",
      roleName: json["role_name"] ?? "",
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "mother_name": motherName,
    "father_name": fatherName,
    "phone": phone,
    "current_address": currentAddress,

    "place_of_birth": placeOfBirth,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "status": status,
    "role_name": roleName,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };

}

class Pivot {
  Pivot({
    required this.caseId,
    required this.userId,
  });

  final int caseId;
  final int userId;

  factory Pivot.fromJson(Map<String, dynamic> json){
    return Pivot(
      caseId: json["case_id"] ?? 0,
      userId: json["user_id"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "case_id": caseId,
    "user_id": userId,
  };

}
