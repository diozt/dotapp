import 'dart:convert';

import 'package:dotapp/app/data/models/api_model.dart';
import 'package:dotapp/app/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  final box = GetStorage();
  late Map data = box.read("dataUser") as Map<String, dynamic>;

  var dataUser;
  var isLoading = true.obs;
  var user;

  @override
  void onInit() async {
    // TODO: implement onInit

    super.onInit();

    //http request post
    var response = await http.get(Uri.parse(ApiData.mainUrl + ApiData.userURL));
    if (response.statusCode == 200) {
      user = jsonDecode(response.body);
      if (user['error'] == true) {
        //
      } else {
        // load berhasil
        dataUser = UserModel.fromJson(jsonDecode(response.body));
        print('load master krs berhasil');
        print(user);
      }
      isLoading.value = false;
    }
  }
}
