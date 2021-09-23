import 'package:flutter/material.dart';
import 'package:piet/screens/login/Login/login_screen.dart';
import 'package:piet/screens/login/Signup/regnow_screen.dart';
import 'package:piet/screens/login/Welcome/background.dart';
import 'package:piet/utilities/constants.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
  }

  class _WelcomeScreenState extends State<WelcomeScreen> {

    Widget _buildLoginBtn() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFF1E6FF),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: MaterialButton(
          elevation: 6.0,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text('LOGIN',
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: kPrimaryLightColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      );
    }

    Widget _buildRegBtn() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: MaterialButton(
          elevation: 6.0,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegNowScreen()),
            );
          },
          child: Text('REGISTER NOW',
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: kPrimaryColor,
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
                "WELCOME TO P.I.E.T.",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SvgPicture.asset(
                "assets/icons/chat.svg",
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _buildLoginBtn(),
              _buildRegBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
