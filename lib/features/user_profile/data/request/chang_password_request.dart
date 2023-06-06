class ChangePasswordRequest{
  String old;
  String newPass;

//<editor-fold desc="Data Methods">
  ChangePasswordRequest({
    required this.old,
    required this.newPass,
  });

  ChangePasswordRequest copyWith({
    String? old,
    String? newPass,
  }) {
    return ChangePasswordRequest(
      old: old ?? this.old,
      newPass: newPass ?? this.newPass,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'old': this.old,
      'newPass': this.newPass,
    };
  }

  factory ChangePasswordRequest.fromMap(Map<String, dynamic> map) {
    return ChangePasswordRequest(
      old: map['old'] as String,
      newPass: map['newPass'] as String,
    );
  }

//</editor-fold>
}