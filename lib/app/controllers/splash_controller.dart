import 'package:dotapp/app/controllers/auth_controller.dart';
import 'package:dotapp/app/routes/rout_name.dart';
import 'package:dotapp/app/ui/login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:gostrada/app/controllers/auth/auth_c.dart';
// import 'package:gostrada/app/routes/rout_name.dart';
// import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  final c = Get.find<AuthController>();
  final int timerSplash = 5;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: timerSplash), () async {
      final box = GetStorage();

      final dataUser = box.read('dataUser');

      // check if user data is not null
      if (dataUser != null) {
        print('User Logged in, go to dashboard ');
        // user data has been previously saved, go to dashboard
        c.login(dataUser['username'], dataUser['password']);
      } else {
        print('Go to login page');
        Get.offAllNamed(RoutName.login);
      }
    });
  }
}
