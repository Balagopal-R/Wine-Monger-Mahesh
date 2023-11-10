import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wine_monger_mahesh/dashboard/dashboard.dart';
import '../managers/shared_preference/shared_prefernce.dart';
import '../models/login_model.dart';
import 'package:connectivity/connectivity.dart';

class LoginController extends GetxController {
  late final WMSharedPreference sp = WMSharedPreference();

  final Connectivity connectivity = Connectivity();
  var hasInternet = true.obs;

  bool obscureText = true;
  void passwordObscure() {
    print("passwordObscure visible");
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    final connectivityResult = await connectivity.checkConnectivity();
    hasInternet.value = connectivityResult != ConnectivityResult.none;
  }

  Future<LoginModel> loginWithEmail(username, password) async {
    var headers = {'Content-Type': 'application/json'};
    var responseBody;

    if (!hasInternet.value) {
      errorSnackBar('Please check your internet connection');
      print('No Internet');
    }

    try {
      var url = Uri.parse("http://winemonger.nintriva.com//api/login");

      Map body = {'username': username, 'password': password};

      final response = await http.post(url, body: body);
      print(response);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        responseBody = LoginModel.fromJson(json);

        print(responseBody);

        var userLevel = responseBody.userLevel;
        print(userLevel);
        var apiKey = responseBody.apiKey;
        print(apiKey);
        var name = responseBody.firstname;
        print(name);

        await sp.saveUserInformation(name, userLevel, apiKey);
        Get.to(DashBoardScreen());

        return responseBody;
      } else {
        print("body: ${response.body}");

        errorSnackBar('Invalid Username or Password');
        return responseBody;
      }
    } catch (e) {
      print("error in catch");
    }
    return responseBody;
  }

  void errorSnackBar (String messageText){

    Get.snackbar(
          "Alert",
          messageText,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff717F5E),
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10),
          isDismissible: true,
          titleText: Text(
            "Alert",
            style: TextStyle(fontSize: 20, color: Color(0xffFFFFFF)),
          ),
          messageText: Text(
            messageText,
            style: TextStyle(fontSize: 16, color: Color(0xffFFFFFF)),
          ),
        );
  }
}
