import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    int code;
    String apiKey;
    String userid;
    String firstname;
    String lastname;
    String userLevel;

    LoginModel({
        required this.code,
        required this.apiKey,
        required this.userid,
        required this.firstname,
        required this.lastname,
        required this.userLevel,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        apiKey: json["api_key"],
        userid: json["userid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        userLevel: json["user_level"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "api_key": apiKey,
        "userid": userid,
        "firstname": firstname,
        "lastname": lastname,
        "user_level": userLevel,
    };
}
