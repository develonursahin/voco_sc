// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserRequestModel {
  String? email;
  String? password;
  UserRequestModel({this.email, this.password});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRequestModel(
      email: json['email'] != null ? json['email'] as String : null,
      password: json['password'] != null ? json['password'] as String : null,
    );
  }
}
