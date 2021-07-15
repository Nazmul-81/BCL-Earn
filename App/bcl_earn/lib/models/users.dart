import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final int balance;
  final String name;
  final String password;
  final String mobile;
  final String uid;
  final String country;
  final int refer;
  final DateTime dailyBonusDate;

  MyUser(this.balance, this.name, this.password, this.mobile, this.uid,
      this.country, this.refer, this.dailyBonusDate);

  Map<String, dynamic> toMap() {
    return {
      'balance': balance,
      'name': name,
      'password': password,
      'mobile': mobile,
      'uid': uid,
      'country': country,
      'refer': refer,
      'dailyBonusDate': dailyBonusDate
    };
  }

  static MyUser toObj(DocumentSnapshot documentSnapshot) {
    return MyUser(
        documentSnapshot['balance'],
        documentSnapshot['name'],
        documentSnapshot['password'],
        documentSnapshot['mobile'],
        documentSnapshot['uid'],
        documentSnapshot['country'],
        documentSnapshot['refer'],
        DateTime.parse(documentSnapshot['dailyBonusDate'].toDate().toString()));
  }
}
