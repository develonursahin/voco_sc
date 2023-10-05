class UserData {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}

class UsersResponseModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserData> data;

  UsersResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    final Iterable users = json['data'];
    final List<UserData> userData =
        users.map((model) => UserData.fromJson(model)).toList();

    return UsersResponseModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: userData,
    );
  }
}
