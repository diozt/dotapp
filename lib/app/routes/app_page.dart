import 'package:dotapp/app/routes/rout_name.dart';
import 'package:dotapp/app/ui/home/home.dart';
import 'package:dotapp/app/ui/login/login.dart';
import 'package:dotapp/app/ui/splash/splash.dart';
import 'package:get/get.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: RoutName.splash,
      page: () => SplashScreen(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutName.home,
      page: () => HomePage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutName.login,
      page: () => LoginPage(),
      // binding: LoginBinding(),
    ),
  ];
}
