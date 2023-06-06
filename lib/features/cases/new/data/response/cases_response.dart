

class CasesResponse {
  CasesResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  final String accessToken;
  final String tokenType;
  final num expiresIn;
  final Case user;

    factory CasesResponse.fromJson(Map<String, dynamic> json){
    return CasesResponse(
      accessToken: json["access_token"] ?? "",
      tokenType: json["token_type"] ?? "",
      expiresIn: json["expires_in"] ?? 0,
      user: Case.fromJson(json["user"]??{}),
    );
  }

  Map<String, dynamic> toJson() =>
      {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "user": user.toJson(),
      };

}

class Case {
  Case({
    required this.id,
    required this.title,
    required this.Status,
    required this.Value_Status,
    required this.case_room,
    required this.court_id,
  });
  final int id;
  final String title;
  final String Status;
  final int Value_Status;
  final String case_room;
  final int court_id;


  factory Case.fromJson(Map<String, dynamic> json){
    return Case(

      id: json['id']??0,
      title: json['title']??'',
      Status: json['Status']??'',
      Value_Status: json['Value_Status']??0,
      court_id: json['court_id']??0,
      case_room: json['case_room']??'',
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
        'Status': Status,
        'Value_Status': Value_Status,
        'court_id': court_id,
        'case_room': case_room,
      };

}
