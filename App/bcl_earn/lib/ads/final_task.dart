import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/controllers/task/task_controller.dart';
import 'package:bcl_earn/views/widgets/banner_ad2.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'banner_ad.dart';

class MyFinalPage extends StatefulWidget {
  @override
  _MyFinalPageState createState() => _MyFinalPageState();
}

class _MyFinalPageState extends State<MyFinalPage> {
  final taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.task,
        ),
        centerTitle: true,
        actions: [
          /*IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Get.off(() => MyFinalPage());
              })*/
        ],
      ),
      bottomNavigationBar: BannerAds(),
      backgroundColor: MyColors.appBarColor,
      body: Column(
        children: [
          BannerAds(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: MyText(
                label: "Final Task",
                color: Colors.white,
                size: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey,
                        padding: EdgeInsets.all(10),
                        child: MyText(
                          label:
                              "You have to click this ad after loading and wait for ${taskController.myAdmin.claimTime} seconds to get points.",
                          color: Colors.white,
                          size: 20,
                          fontWeight: FontWeight.bold,
                          textAlignment: TextAlign.center,
                        ),
                      ),
                      Expanded(child: MyAd2()),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
