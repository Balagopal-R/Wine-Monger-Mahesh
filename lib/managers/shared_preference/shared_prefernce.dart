import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WMSharedPreference extends GetxController{
  
  Future<void> saveUserInformation(
      String username, String userLevel, String apiKey) async {
        
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("name", username);
    await pref.setString("userLevel", userLevel);
    await pref.setString("apiKey", apiKey);

    var name = pref.getString("name");
    // print('----$name');

    var level = pref.getString("userLevel");
    // print('--$level');

    var api_Key = pref.getString("apiKey");
    // print('-------$api_Key');
  }

   getUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var name = pref.getString("name");
    // print("ThinkOne---------------$name");
    return pref.getString("name");
  }

   getUserLevel() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? level = pref.getString("userLevel");
    if (level == "100") {
      return "Admin";
    } else {
      return "User";
    }
  }

   getApiKey() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? api_Key = pref.getString("apiKey");
    return api_Key;
  }

  Future<void> logOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove("name");
    await pref.remove("userLevel");
    await pref.remove("apiKey");
  }
}
