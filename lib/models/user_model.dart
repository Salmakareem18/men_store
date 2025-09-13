class UserModel {
  String? token;
  UserModel(this.token);
  UserModel.fromjason(Map<String, dynamic> json) {
    token = json['token'];
  }
}
