import 'package:flutter/material.dart';
import 'package:elchackathon_app/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  String username;
  String email;
  String password;
  String confirmpassword;
  TextEditingController nameTextEditingController = TextEditingController();
  String _labelText;
  TextEditingController nameTextEditingController1 = TextEditingController();
  String _labelText1;
  TextEditingController nameTextEditingController2 = TextEditingController();
  String _labelText2;
  TextEditingController nameTextEditingController3 = TextEditingController();
  String _labelText3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/2-100,
                decoration: BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage('assets/HospitalBackground.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/2-180, 0, 0),
                child: Container(
                  height:MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2-140, 0, 0),
                child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850],
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2-60, 40, 0),
                child: Container(
                  height: 55,
                  //width: MediaQuery.of(context).size.width-50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      textAlign: TextAlign.start,
                      onChanged: (v){
                        setState(() {
                          if(v.isNotEmpty){
                            _labelText3 = 'Username';
                          }else{
                            _labelText3 = null;
                          }
                          username = v;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      controller: nameTextEditingController3,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20, color:Colors.grey[400]),
                        hintText: 'Username',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                        labelText: _labelText3,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2+20, 40, 0),
                child: Container(
                  height: 55,
                  //width: MediaQuery.of(context).size.width-50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      textAlign: TextAlign.start,
                      onChanged: (v){
                        setState(() {
                          if(v.isNotEmpty){
                            _labelText = 'Email';
                          }else{
                            _labelText = null;
                          }
                          email = v;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      controller: nameTextEditingController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20, color:Colors.grey[400]),
                        hintText: 'Email',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                        labelText: _labelText,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2+100, 40, 0),
                child: Container(
                  height: 55,
                  //width: MediaQuery.of(context).size.width-50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      textAlign: TextAlign.start,
                      onChanged: (v){
                        setState(() {
                          if(v.isNotEmpty){
                            _labelText1 = 'Password';
                          }else{
                            _labelText1 = null;
                          }
                          password = v;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      controller: nameTextEditingController1,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20, color:Colors.grey[400]),
                        hintText: 'Password',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                        labelText: _labelText1,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2+180, 40, 0),
                child: Container(
                  height: 55,
                  //width: MediaQuery.of(context).size.width-50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      textAlign: TextAlign.start,
                      onChanged: (v){
                        setState(() {
                          if(v.isNotEmpty){
                            _labelText2 = 'Confirm Password';
                          }else{
                            _labelText2 = null;
                          }
                          confirmpassword = v;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      controller: nameTextEditingController2,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontSize: 20, color:Colors.grey[400]),
                        hintText: 'Confirm Password',
                        labelStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                        ),
                        labelText: _labelText2,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(35, MediaQuery.of(context).size.height/2+260, 35, 0),
                child: FlatButton(
                  onPressed: ()async {
                    if (confirmpassword != password) {
                      showAlertDialog(context, 'Both passwords should match');
                    } else if (password.length < 8) {
                      showAlertDialog(context, 'Password too short');
                    }else if(username.isEmpty){
                      showAlertDialog(context, 'Please enter a username');
                    }else if(email.isEmpty){
                      showAlertDialog(context, 'Please enter an email');
                    }
                    else {
                      try {
                        final newUser =
                        await _auth.createUserWithEmailAndPassword(
                            email: email, password: password);
                        await DatabaseService().updateUserData(username);
                        sendVerificationEmail();
                        if (newUser != null) {
                          Fluttertoast.showToast(
                              msg: "Registration successful",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black54,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        showAlertDialog(context, 'Username already registered');
                      }
                    }
                  },
                  color: Colors.cyan,
                  child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Center(child: Text('SIGN UP',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2
                        ),
                      ))
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side:BorderSide(color: Colors.white,width: 3
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void sendVerificationEmail() async {
    var User = await FirebaseAuth.instance.currentUser;
    try{
      await User.sendEmailVerification();
      Fluttertoast.showToast(msg: 'Email Verification send, Please verify your email');
    }catch(e){
      Fluttertoast.showToast(msg: 'Some Error Occurred');
    }
  }
}

showAlertDialog(BuildContext context, String str) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Error"),
    content: Text(str),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
