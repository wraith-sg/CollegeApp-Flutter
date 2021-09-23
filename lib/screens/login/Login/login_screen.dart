import 'package:flutter/material.dart';
import 'package:piet/utilities/constants.dart';
import 'package:piet/screens/login/Signup/regnow_screen.dart';
import 'package:piet/screens/login/Login/background.dart';
import 'package:piet/utilities/account_check.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:piet/screens/existing_student/exisstudent_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String mail = '';
  String pass = '';
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailcontroller.text, password: _passwordcontroller.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      if (user.emailVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ExisStudentScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (builder) => AlertDialog(
            content: Text('Please Verify your Email'),
            actions: <Widget>[
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1,
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      print('Wrong Email ID or Password');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Wrong Email ID or Password"),
        ),
      );
    }
  }

  Widget _buildEmailTF() {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: _emailcontroller,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value.isEmpty) return '*Please enter your email';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Email',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildPasswordTF() {
    return Column(children: <Widget>[
      Text('Password', style: kLabelStyle),
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: _passwordcontroller,
          obscureText: true,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value.isEmpty) return '*Please enter your password';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Password',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildLoginBtn() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      child: MaterialButton(
        elevation: 6.0,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29),
        ),
        onPressed: () {
          // async {
          //   if (_formKey.currentState.validate()) {
          //     _signInWithEmailAndPassword();
          //   }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ExisStudentScreen()),
          );
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(
                    color: kPrimaryColor,
                    letterSpacing: 1.5,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Form(
                  key: _formKey,
                  child: Column(
                      children: <Widget>[
                        _buildEmailTF(),
                        _buildPasswordTF(),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.015),
                        _buildLoginBtn(),
                      ]
                  ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegNowScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
