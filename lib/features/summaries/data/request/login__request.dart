class LoginRequest {


  LoginRequest({
    this.phone = '',
    this.password = '',
  });

  String phone;
  String password;


  LoginRequest copyWith({
    String? phone,
    String? password,
  }) {
    return LoginRequest(
      phone: phone ?? this.phone,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      phone: json['phone'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
