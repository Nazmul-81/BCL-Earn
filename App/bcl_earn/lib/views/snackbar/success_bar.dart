import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackBar {
  static show(label) {
    Get.showSnackbar(GetBar(
      messageText: MyText(
        label: "$label",
        color: Colors.white,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.green,
    ));
  }
}
