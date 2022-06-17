import 'package:dotapp/app/controllers/auth_controller.dart';
import 'package:dotapp/app/controllers/place_controller.dart';
import 'package:dotapp/app/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SplashController>(() => SplashController());
    Get.put(AuthController());
    Get.lazyPut<PlaceController>(() => PlaceController());
  }
}
