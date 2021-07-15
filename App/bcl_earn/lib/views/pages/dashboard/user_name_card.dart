import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNameCard extends StatelessWidget {
  final userController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
      ),
      color: MyColors.appBarColor,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: CircleAvatar(
                radius: Get.height / 16 + 2,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: Get.height / 16,
                  backgroundImage: AssetImage(MyImages.loginPerson),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GetX<AuthController>(builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    label: controller.myUser.name,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 20.0,
                  ),
                  MyText(
                    label: controller.myUser.mobile,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 16.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyText(
                    label: "Your Balance: ",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 16.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wallet_giftcard_outlined,
                        color: Colors.white,
                      ),
                      MyText(
                        label: '${controller.myUser.balance}',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        size: 16.0,
                      ),
                    ],
                  ),
                ],
              );
            }),
          )),
        ],
      ),
    );
  }
}
