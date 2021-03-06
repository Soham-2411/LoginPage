import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final  CollectionReference userCollection = Firestore.instance.collection('Users');

  Future updateUserData(String name) async{
    return await userCollection.document(uid).set({
      'displayName': name,
    });
  }
}