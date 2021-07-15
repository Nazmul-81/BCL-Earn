import 'package:bcl_earn/ads/banner_ad.dart';
import 'package:bcl_earn/constants/colors.dart';
import 'package:bcl_earn/constants/strings.dart';
import 'package:bcl_earn/views/widgets/drawer.dart';
import 'package:bcl_earn/views/pages/dashboard/dashboard.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyDashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        title: MyText(
          label: MyStrings.appName,
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: MyDashBoard(),
      bottomNavigationBar: BannerAds(),
    );
  }
}
