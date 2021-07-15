import 'package:bcl_earn/error/error.dart';
import 'package:bcl_earn/models/users.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/service/auth_service.dart';
import 'package:bcl_earn/service/login_service.dart';
import 'package:bcl_earn/service/signup_service.dart';
import 'package:bcl_earn/service/user_service.dart';
import 'package:bcl_earn/views/snackbar/success_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:bcl_earn/helper/date_difference.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  String country = "Bangladesh";
  var isLoading = false.obs;

  var allUser = <MyUser>[].obs;
  List<MyUser> get allUsers => allUser;

  Rx<MyUser> myUser_ = MyUser(0, 'Unknown', 'Unknown', 'Unknown', 'Unknown',
          'Unknown', 0, DateTime.now().subtract(Duration(days: 2)))
      .obs;
  MyUser get myUser => myUser_.value;

  @override
  onInit() {
    //_myUser.bindStream(UserService().getCurrentUser());
    allUser.bindStream(UserService().getAllUsers());
    if (FirebaseAuth.instance.currentUser != null) {
      UserService().getCurrentUser().then((value) => myUser_.value = value);
    }
    print(myUser.uid);
    print(myUser.name);
    super.onInit();
  }

  getDailyBalance() {
    UserService().updateUserBalance(10, myUser).then((value) {
      UserService().getCurrentUser().then((user) {
        int val = DateDifference().days(user.dailyBonusDate);
        print('val');
        print(val);
        if (val != 0) {
          myUser_.value = user;
          MySnackBar.show('Bonus Added Successfully');
        } else {
          MySnackBar.show('Bonus Already taken');
        }
      });
    }).catchError((e) {
      ErrorHandler.handle(e);
    });
  }

  login() {
    if (formKey.currentState.validate()) {
      print(mobileController.text);
      isLoading.value = true;
      LoginService()
          .userCheck(
              mobileController.text + '@gmail.com', passwordController.text)
          .then((user) {
        if (user.user != null) {
          UserService().getCurrentUser().then((user) {
            myUser_.value = user;
            isLoading.value = false;
            Get.to(() => MyRoot());
          });
        }
        isLoading.value = false;
      }).catchError((e) {
        isLoading.value = false;
        ErrorHandler.handle(e);
      });
    }
  }

  signUp() {
    if (formKey.currentState.validate()) {
      isLoading.value = true;

      SignUpService()
          .signUp(mobileController.text + "@gmail.com", passwordController.text)
          .then((user) {
        if (user != null) {
          var myUser = MyUser(
              0,
              nameController.text,
              passwordController.text,
              mobileController.text,
              user.uid,
              country,
              0,
              DateTime.now().subtract(Duration(days: 2)));
          SignUpService().createUser(myUser).then((value) {
            UserService().getCurrentUser().then((user) {
              myUser_.value = user;
              isLoading.value = false;
              Get.to(() => MyRoot());
            });
          }).catchError((e) {
            isLoading.value = false;
            ErrorHandler.handle(e);
          });
        }
      }).catchError((e) {
        isLoading.value = false;
        ErrorHandler.handle(e);
      });
    }
  }

  @override
  void onClose() {
    print("ON CLOSE Auth");
    super.onClose();
  }
}
