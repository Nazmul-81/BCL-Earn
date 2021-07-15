import 'package:bcl_earn/views/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyTable {
  static TableRow row() {
    double frontSize = 18;

    return TableRow(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29d6d6d6),
              offset: Offset(0, 13),
              blurRadius: 20,
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '001',
              color: Colors.black,
              size: frontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Nazmul Hasan',
              color: Colors.black,
              size: frontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '345',
              color: Colors.black,
              size: frontSize,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: '3',
              color: Colors.black,
              size: frontSize,
            ),
          ),
        ]);
  }

  static TableRow head() {
    double frontSize = 18;

    return TableRow(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: const Color(0x29d6d6d6),
              offset: Offset(0, 13),
              blurRadius: 20,
            ),
          ],
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Rank',
              color: Colors.black,
              size: frontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'User Name',
              color: Colors.black,
              size: frontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Points',
              color: Colors.black,
              size: frontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: MyText(
              label: 'Refers',
              color: Colors.black,
              size: frontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]);
  }
}
