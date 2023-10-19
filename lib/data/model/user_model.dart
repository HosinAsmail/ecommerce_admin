class UserModel {
  String? usersName;
  String? usersEmail;
  String? usersPhone;
  String? usersId;

  UserModel({this.usersName, this.usersEmail, this.usersPhone, this.usersId});

  UserModel.fromJson(Map<String, dynamic> json) {
    usersName = json['users_name'];
    usersEmail = json['users_email'];
    usersId = json['users_id'];
    usersPhone = json['users_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['users_name'] = usersName;
    data['users_email'] = usersEmail;
    data['users_id'] = usersId;
    data['users_phone'] = usersPhone;

    return data;
  }
}
