import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void handle(error) {
    switch (error) {
      case 'a':
        {
          // statements;
        }
        break;

      case 'constant_expr2':
        {
          //statements;
        }
        break;

      default:
        {
          print(error.runtimeType);
          if (error.runtimeType == FirebaseAuthException) {
            Get.showSnackbar(GetBar(
              messageText: MyText(
                label: error.toString().split(']')[1],
                color: Colors.white,
              ),
              duration: Duration(seconds: 4),
              backgroundColor: Colors.red,
            ));
          } else {
            Get.showSnackbar(GetBar(
              messageText: MyText(
                label: "Something Error:" + error.toString(),
                color: Colors.white,
              ),
              duration: Duration(seconds: 4),
              backgroundColor: Colors.red,
            ));
          }
        }

        break;
    }
  }
}
