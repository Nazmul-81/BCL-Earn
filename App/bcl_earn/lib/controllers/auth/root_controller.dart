import 'package:bcl_earn/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class RootController extends GetxController {
  Rx<User> _firebaseUser = FirebaseAuth.instance.currentUser.obs;
  User get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(AuthService().isLogin());
    super.onInit();
  }
}
