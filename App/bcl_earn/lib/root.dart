import 'package:bcl_earn/controllers/auth/root_controller.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard_page.dart';
import 'package:bcl_earn/views/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRoot extends StatelessWidget {
  final authController = Get.put(RootController());
  @override
  Widget build(BuildContext context) {
    return GetX<RootController>(builder: (controller) {
      if (controller.user == null) {
        return MyLoginPage();
      } else {
        return MyDashBoardPage();
      }
    });
  }
}
