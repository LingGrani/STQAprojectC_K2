import 'package:final_project_2023/app/modules/home/views/home_view.dart';
import 'package:final_project_2023/app/modules/home/views/login_page.dart';
import 'package:firedart/firedart.dart';
import 'package:get/get.dart';

//Mengimplementasikan login controller
class LoginController extends GetxController {
  void login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signIn(email, password);
      var user = await FirebaseAuth.instance.getUser();
      Get.offAll(() => HomeView());
    } catch (e) {
      if (e.toString() == "AuthException: INVALID_EMAIL") {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "Format email tidak sesuai",
          duration: Duration(seconds: 2),
        ));
      } else if (e.toString() == "AuthException: INVALID_PASSWORD") {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "Password salah",
          duration: Duration(seconds: 2),
        ));
      } else if (e.toString() == "AuthException: EMAIL_NOT_FOUND") {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "User belum terdaftar",
          duration: Duration(seconds: 2),
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: "Login Error",
          message: "Unknow Error",
          duration: Duration(seconds: 2),
        ));
      }
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    Get.offAll(() => LoginPage());
  }
}
