class Login_model {
  bool? success;
  String? token;

  Login_model({this.success, this.token});

  Login_model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['token'] = this.token;
    return data;
  }
}
