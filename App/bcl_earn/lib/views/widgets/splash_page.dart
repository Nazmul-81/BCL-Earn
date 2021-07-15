import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/root.dart';
import 'package:bcl_earn/views/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logo.dart';

class MySplashPage extends StatefulWidget {
  @override
  _MySplashPageState createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1))
        .then((value) => Get.to(() => MyRoot()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MyLogo(),
      ),
      backgroundColor: MyColors.splashPageBackgroundColor,
    );
  }
}
