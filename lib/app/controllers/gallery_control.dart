import 'dart:convert';

import 'package:dotapp/app/data/models/api_model.dart';
import 'package:dotapp/app/data/models/gallery_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GalleryController extends GetxController {
  var dataGallery;
  var isLoading = true.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    // karena tidak url dicontoh langsung berupa JSON tanpa parameter, dapat menggunakan get
    var response =
        await http.get(Uri.parse(ApiData.mainUrl + ApiData.galleryURL));

    // print(response.body);
    if (response.statusCode == 200) {
      var user = jsonDecode(response.body);

      if (user['error'] == true) {
        //
      } else {
        // load berhasil
        dataGallery = GalleryModel.fromJson(jsonDecode(response.body));
      }
      isLoading.value = false;
    }
  }
}
