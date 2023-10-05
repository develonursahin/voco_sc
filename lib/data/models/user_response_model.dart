// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserResponseModel {
  String? token;
  UserResponseModel({this.token});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
    };
  }

  factory UserResponseModel.fromJson(Map<String, dynamic> json) {
    return UserResponseModel(
      token: json['token'] != null ? json['token'] as String : null,
    );
  }
}