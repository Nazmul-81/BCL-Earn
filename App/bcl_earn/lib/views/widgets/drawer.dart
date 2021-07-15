import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/root.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer_button.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.splashPageBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  child: Image(
                    image: AssetImage(MyStrings.coverUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                MyDrawerButton(
                  label: "About",
                  icon: Icons.person,
                  onClick: () {},
                ),
                MyDrawerButton(
                  label: "Logout",
                  icon: Icons.person,
                  onClick: () {
                    FirebaseAuth.instance
                        .signOut()
                        .then((value) => Get.to(() => MyRoot()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
