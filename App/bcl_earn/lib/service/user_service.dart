import 'package:bcl_earn/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
/*  Stream<MyUser> getCurrentUser() {
    var stream = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .snapshots();
    return stream.map((event) => MyUser.toObj(event));
  }*/

  Stream<List<MyUser>> getAllUsers() {
    var stream = FirebaseFirestore.instance.collection('users').snapshots();
    return stream
        .map((event) => event.docs.map((e) => MyUser.toObj(e)).toList());
  }

  Future<MyUser> getCurrentUser() async {
    var user;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      user = MyUser.toObj(value);
    });
    return user;
  }

  Future updateUserBalance(int bal, MyUser user) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .update({'balance': user.balance + bal});
  }
}
