class UserModel {
  int? id;
  String? fullname;
  String? username;
  String? phone;
  String? email;

  UserModel({this.id, this.fullname, this.username, this.phone, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['username'] = username;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
