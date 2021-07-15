import 'package:cloud_firestore/cloud_firestore.dart';

class MyAdmin {
  final int totalTask;
  final int adTime;
  final int claimTime;
  final int claimPoint;
  final int dailyBonus;

  MyAdmin(this.totalTask, this.adTime, this.claimTime, this.dailyBonus,
      this.claimPoint);

  Map<String, dynamic> toMap() {
    return {
      'totalTask': totalTask,
      'adTime': adTime,
      'claimTime': claimTime,
      'claimPoint': claimPoint,
      'dailyBonus': dailyBonus
    };
  }

  static MyAdmin toObj(DocumentSnapshot documentSnapshot) {
    return MyAdmin(
        documentSnapshot['totalTask'],
        documentSnapshot['adTime'],
        documentSnapshot['claimTime'],
        documentSnapshot['claimPoint'],
        documentSnapshot['dailyBonus']);
  }
}
