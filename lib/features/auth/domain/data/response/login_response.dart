class LoginResponse {
  LoginResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
    required this.user,
  });

  final String accessToken;
  final String tokenType;
  final num expiresIn;
  final User user;

  factory LoginResponse.fromJson(Map<String, dynamic> json){
    return LoginResponse(
      accessToken: json["access_token"] ?? "",
      tokenType: json["token_type"] ?? "",
      expiresIn: json["expires_in"] ?? 0,
      user: User.fromJson(json["user"]??{}),
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

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.motherName,
    required this.fatherName,
    required this.phone,
    required this.currentAddress,
    required this.placeOfBirth,
    required this.email,
    required this.emailVerifiedAt,
    required this.status,
    required this.roleName,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String motherName;
  final String fatherName;
  final String phone;
  final String currentAddress;
  final String placeOfBirth;
  final dynamic email;
  final dynamic emailVerifiedAt;
  final String status;
  final String roleName;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"] ?? 0,
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      motherName: json["mother_name"] ?? "",
      fatherName: json["father_name"] ?? "",
      phone: json["phone"] ?? "",
      currentAddress: json["current_address"] ?? "",
      placeOfBirth: json["place_of_birth"] ?? "",
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      status: json["status"] ?? "",
      roleName: json["role_name"] ?? "",
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() =>
      {
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
        "created_at": createdAt,
        "updated_at": updatedAt,
      };

}
