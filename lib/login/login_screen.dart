import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wine_monger_mahesh/dashboard/dashboard_screen.dart';
import 'package:wine_monger_mahesh/login/login.dart';
import 'package:wine_monger_mahesh/utils/constants/image_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailTitleController = TextEditingController();
  final passwordTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Color(0xffFFFFFF),
              body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height - 65,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'WINEMONGER',
                            style: GoogleFonts.openSans(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff717F5E)),
                          ),

                          Image.asset(kLogoImage, height: size.height * 0.3),

//                   SvgPicture.string(
//   kLogoImageSvg,
//   height: 50,
//   width: 50,
// ),

                          Text(
                            'Hello There!',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Your papers please... ',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 35,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xffDFDFDF),
                                width: 1.0,
                              ),
                              color: const Color(0xffFFFFFF),
                            ),
                            child: TextFormField(
                              controller: emailTitleController,
                              cursorColor: Colors.black,
                              cursorWidth: 1,
                              decoration: const InputDecoration(
                                  hintText: "Email address",
                                  hintStyle: TextStyle(
                                      color: Color(0xffAEAEAE),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal),
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 35,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: const Color(0xffDFDFDF),
                                width: 1.0,
                              ),
                              color: const Color(0xffFFFFFF),
                            ),
                            child: TextFormField(
                              obscureText: controller.obscureText,
                              controller: passwordTitleController,
                              cursorColor: Colors.black,
                              cursorWidth: 1,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    color: Color(0xffAEAEAE),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal),
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.remove_red_eye_sharp),
                                  onPressed: () {
                                    controller.passwordObscure();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Obx(() {
                          if (controller.hasInternet.value) {
                            return GestureDetector(
                                onTap: () async {
                                  controller.loginWithEmail(
                                      emailTitleController.text,
                                      passwordTitleController.text);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xff717F5E),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ));
                          } else {
                            controller.errorSnackBar(
                                'Please check your internet connection');
                            return const Text(
                                'No internet connection. Please check your network.');
                          }
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
