class UserModel {
  final String token;
  final int roleId;
  final String rolePosition;

  UserModel(this.token, this.roleId, this.rolePosition);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['token'],
      int.parse(json['role'][0]),
      json['role'][1],
    );
  }
}
