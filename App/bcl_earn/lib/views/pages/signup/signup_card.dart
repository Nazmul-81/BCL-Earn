import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/images.dart';
import 'package:bcl_earn/controllers/auth/auth_controller.dart';

import 'package:bcl_earn/views/widgets/country_picker.dart';
import 'package:bcl_earn/views/widgets/form_field.dart';
import 'package:bcl_earn/views/widgets/login_button.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SignUpCard extends StatelessWidget {
  final controller = Get.put(AuthController());
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
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.size.height / 16,
                          ),
                          MyTextFormField(
                            controller: controller.nameController,
                            labelText: 'Name',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.name,
                            validationMassage: "Name Required",
                          ),
                          MyTextFormField(
                            controller: controller.mobileController,
                            labelText: 'Mobile Number',
                            onChange: (val) {},
                            obscureText: false,
                            isPass: false,
                            keyBoard: TextInputType.number,
                            validationMassage: "Mobile Number Required",
                          ),
                          MyTextFormField(
                            controller: controller.passwordController,
                            labelText: 'Create a Password',
                            onChange: (val) {},
                            obscureText: true,
                            isPass: true,
                            keyBoard: TextInputType.text,
                            validator: (String val) {
                              if (val.length < 8) {
                                return "Password at least 8 digit";
                              } else
                                return null;
                            },
                          ),
                          MyTextFormField(
                            controller: controller.confirmPasswordController,
                            labelText: 'Confirm Password',
                            onChange: (val) {},
                            obscureText: true,
                            isPass: true,
                            validator: (String val) {
                              if (val != controller.passwordController.text) {
                                return "Password is not Match";
                              } else
                                return null;
                            },
                          ),
                          MyCountryPicker(
                            onChange: (CountryCode countryCode) {
                              controller.country = countryCode.name;
                            },
                          ),

                          ///button
                          Obx(() {
                            return (controller.isLoading.value)
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.red,
                                    ),
                                  )
                                : MyLoginButton(
                                    label: "SIGNUP",
                                    onClick: () {
                                      controller.signUp();
                                    },
                                    color: MyColors.appBarColor,
                                    labelColor: Colors.white,
                                  );
                          }),
                        ],
                      ),
                    ),
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
