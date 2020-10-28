import 'package:elchackathon_app/HomePage.dart';
import 'package:elchackathon_app/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elchackathon_app/ChatPage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  currentUserEmail();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getString('email');
  runApp(MaterialApp(
    home: status == null? Login(): HomePage(),
  ));
}