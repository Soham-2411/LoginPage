import 'package:elchackathon_app/HomePage.dart';
import 'package:elchackathon_app/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final _auth = FirebaseAuth.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  TextEditingController nameTextEditingController = TextEditingController();
  String _labelText;
  TextEditingController nameTextEditingController1 = TextEditingController();
  String _labelText1;

  @override
  void initState() {
    super.initState();
  }

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
                padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/2-120, 0, 0),
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
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2-80, 0, 0),
                child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[850],
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2, 40, 0),
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
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).size.height/2+80, 40, 0),
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
                padding: EdgeInsets.fromLTRB(35, MediaQuery.of(context).size.height/2+160, 35, 0),
                child: FlatButton(
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password
                      );
                      if (user != null) {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove('email');
                        prefs.setString('email',email);
                        //currentUserEmail();
                        IsEmailVerified();
                      }
                    } catch (e) {
                      showAlertDialog(context, 'Invalid email or password');
                    }
                  },
                  color: Colors.cyan,
                  child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Center(child: Text('SIGN IN',
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
                    side:BorderSide(color: Colors.white,width: 3),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(35, MediaQuery.of(context).size.height/2+190, 35, 0),
                child: Center(
                  child: FlatButton(
                    onPressed: () async {
                      _login();
                    },
                    // splashColor: Colors.transparent,
                    // highlightColor: Colors.transparent,
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width-180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/googleIcon.png'),
                              ),
                            ),
                          ),
                          Text('Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                          )
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side:BorderSide(color: Colors.black,width: 3),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width-400
                    , MediaQuery.of(context).size.height-50, 0, 0),
                child: Center(
                  child: ListTile(
                    leading: Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.05,
                      ),
                    ),
                    title: Transform(
                      transform: Matrix4.translationValues(-40, -1.5, 0.0),
                      child: FlatButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpPage()),
                          );
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          child: Text(
                              'Sign up',
                              style:TextStyle(
                                fontSize: 20,
                                letterSpacing: 1.1,
                                color: Colors.cyan,
                              )
                          ),
                        ),
                      ),
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
  void IsEmailVerified() async{
    var User = await FirebaseAuth.instance.currentUser;
    if(User.emailVerified){
      //MessagesStream();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder:
                  (context) => HomePage()));
    }
    else{
      showAlertDialog(context, 'Please Confirm your email id');
    }
  }
  Future<FirebaseUser> _login() async{
    final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try{
      await _googleSignIn.signIn();
      if(GoogleSignIn == null){
        print('Soham');
      }
      //final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
    }catch(e){
      showAlertDialog(context, e);
    }
    return null;
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
