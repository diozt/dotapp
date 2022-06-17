import 'dart:convert';

import 'package:dotapp/app/data/models/api_model.dart';
import 'package:dotapp/app/ui/home/home.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  final box = GetStorage();
  var isVisible = true.obs;
  var errorMsg = false.obs;
  late TextEditingController email, pass;
  var isLoading = false.obs;
  var errorVal = ''.obs;

  final GlobalKey<FormState> LoginFormKey = GlobalKey<FormState>();

  // Login
  login(email, password) async {
    isLoading.value = true;
    final Map<String, dynamic> dataBody = {};

    //http request post
    var response = await http.post(Uri.parse(ApiData.mainUrl + ApiData.userURL),
        body: dataBody);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);

      if (email == user['data']['email']) {
        if (password == 'Adminn') {
          // login berhasil
          box.write('dataUser', {
            "username": user['data']['email'],
            "password": 'Adminn',
            // "nim": user['nim'],
            // "photo": user['photo'],
            // "name": user['name'],
          });

          isLoading.value = false;
          Future.delayed(Duration(seconds: 3), () async {
            Get.offAll(HomePage());
          });
          // go to dashboard page

        } else {
          errorVal.value = "*Password anda Salah!";
          errorMsg.value = true;
          isLoading.value = false;
        }
      } else {
        // login gagal
        errorVal.value = "*Email tidak terdaftar!";
        errorMsg.value = true;
        isLoading.value = false;
        print("login gagal");
      }
    }
  }

  // logout
  logout() async {
    await box.remove('dataUser');
    errorMsg.value = false;
    email.clear();
    pass.clear();
    // Get.offAllNamed(RoutName.login);
  }
  // end logout

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    email = TextEditingController();
    pass = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    email.dispose();
    pass.dispose();
  }

  String? validatePassword(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z]).{6,}$';
    RegExp regExp = RegExp(pattern);
    if (regExp.hasMatch(value) == false) {
      return "password min 6 characters with 1 uppercase and 1 lowercase";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Please, input valid email";
    } else {
      return null;
    }
  }

  // void checkVlidate() {
  //   final isValid = LoginFormKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }

  //   LoginFormKey.currentState!.save();
  // }
}
