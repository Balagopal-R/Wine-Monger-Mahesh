import 'package:get/get.dart';

import '../managers/shared_preference/shared_prefernce.dart';

class DrawerControllerOne extends GetxController {

  final WMSharedPreference sp = WMSharedPreference();

  final apiKeyOne = "".obs;
  final userLevelOne = "".obs;
  final userNmaeOne = "".obs;

  @override
  void onInit() async {
    await abc();


    super.onInit();
  }

  abc() async {
    apiKeyOne.value = await sp.getApiKey() ?? "Api Key";
    userLevelOne.value = await sp.getUserLevel() ?? "User Level";
    userNmaeOne.value = await sp.getUserName() ?? "User Name";
    update();
  }
}
