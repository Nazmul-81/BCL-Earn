import 'package:bcl_earn/models/dashboard_item.dart';
import 'package:bcl_earn/views/dialogs/simple_dialog.dart';
import 'package:bcl_earn/views/pages/history/history_page.dart';
import 'package:bcl_earn/views/pages/leaderboard/leaderboard_page.dart';
import 'package:bcl_earn/views/pages/profile/profile_page.dart';
import 'package:bcl_earn/views/pages/task/task_page.dart';
import 'package:bcl_earn/views/pages/withdraw/withdraw_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardItems {
  List<Item> items = [
    Item("Start Task", Icons.input, () {
      Get.to(() => MyTaskPage());
    }),
    Item("Profile", Icons.person_rounded, () {
      Get.to(() => MyProfilePage());
    }),
    Item("Daily Bonus", Icons.wine_bar_rounded, () {
      MySimpleDialog().showDialog();
    }),
    Item("Leader Board", Icons.leaderboard, () {
      Get.to(() => MyLeaderBoard());
    }),
    Item("Withdraw", Icons.outbox, () {
      Get.to(() => MyWithdrawPage());
    }),
    Item("History", Icons.history, () {
      Get.to(() => MyHistoryPage());
    }),
    Item("Refer", Icons.room_preferences, () {}),
    Item("Notice", Icons.notification_important_outlined, () {}),
    Item("Support", Icons.support, () {}),
  ];
}
