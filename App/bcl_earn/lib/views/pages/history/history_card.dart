import 'package:bcl_earn/views/pages/leaderboard/leader_row.dart';
import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCard extends StatelessWidget {
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
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green,
                          ),
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: MyText(
                                      label: "History",
                                      color: Colors.white,
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: MyText(
                                      label: "History",
                                      color: Colors.white,
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: MyText(
                                      label: "History",
                                      color: Colors.white,
                                      size: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Table(
                          columnWidths: {
                            0: FlexColumnWidth(1),
                            1: FlexColumnWidth(3),
                            2: FlexColumnWidth(2),
                            4: FlexColumnWidth(2),
                          },
                          border: TableBorder.all(
                            width: 1.0,
                            color: Colors.black,
                          ),
                          children: [
                            MyTable.head(),
                            for (var i = 0; i < 10; i++) MyTable.row(),
                          ],
                        )
                      ],
                    ),
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
