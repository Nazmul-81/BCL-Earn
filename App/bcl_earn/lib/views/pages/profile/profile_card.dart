import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';
import 'package:bcl_earn/views/widgets/profile_text.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: Get.size.height / 16,
              ),
              Padding(
                padding: EdgeInsets.all(Get.size.height / 16),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(15),
                    child: GetX<AuthController>(builder: (controller) {
                      return Column(
                        children: [
                          SizedBox(
                            height: Get.size.height / 16,
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: MyText(
                              label: controller.myUser.name,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                          ProfileText(
                            data: "Mobile no: " +
                                controller.myUser.mobile.toString(),
                          ),
                          ProfileText(
                            data: "Balance: " +
                                controller.myUser.balance.toString(),
                          ),
                          ProfileText(
                            data: "Refer Code: " +
                                controller.myUser.mobile.toString(),
                          ),
                          ProfileText(
                            data:
                                "Refers: " + controller.myUser.refer.toString(),
                          ),
                          ProfileText(
                            data: "Mobile no: " +
                                controller.myUser.mobile.toString(),
                          ),
                          ProfileText(
                            data: "Country: " +
                                controller.myUser.country.toString(),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),

          ///head
          Column(
            children: [
              SizedBox(
                height: Get.size.height / 16,
              ),
              Center(
                child: CircleAvatar(
                  radius: Get.height / 16 + 2,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: Get.height / 16,
                    backgroundImage: AssetImage(MyImages.loginPerson),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
