class Login {
  String error;
  bool status;
  int code;
  DataBean data;

  Login({this.error, this.status, this.code, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    this.error = json['error'];
    this.status = json['status'];
    this.code = json['code'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['status'] = this.status;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }

}

class DataBean {
  String tokenType;
  String accessToken;

  DataBean({this.tokenType, this.accessToken});

  DataBean.fromJson(Map<String, dynamic> json) {    
    this.tokenType = json['token_type'];
    this.accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token_type'] = this.tokenType;
    data['access_token'] = this.accessToken;
    return data;
  }
}
