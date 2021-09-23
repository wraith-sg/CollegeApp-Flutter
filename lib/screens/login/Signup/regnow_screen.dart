import 'package:flutter/material.dart';
import 'package:piet/screens/login/Signup/googlesign.dart';
import 'package:piet/utilities/constants.dart';
import 'package:piet/screens/login/Signup/background.dart';
import 'package:piet/screens/login/Login/login_screen.dart';
import 'package:piet/utilities/account_check.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:piet/screens/new_student/newstudent_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegNowScreen extends StatefulWidget {
  @override
  _RegNowScreenState createState() => _RegNowScreenState();
}

enum Mobileverification {
  Show_Mobile_Form,
  Show_Otp_Form,
}

class _RegNowScreenState extends State<RegNowScreen> {
  Mobileverification currentState = Mobileverification.Show_Mobile_Form;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _otp = TextEditingController();

  String verificationID;
  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
      await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;
      });
      if (authCredential?.user != null) {
        String sa = _phone.text;
        Map<String, dynamic> data = {
          "Name": _name.text,
          "Email": _email.text,
          "Contact no": '+91$sa'
        };
        FirebaseFirestore.instance.collection("NEW-Student").add(data);
        // FirebaseDatabase.collection().document().set(data);
        // instance.reference().push().set(data);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NewStudentScreen()));
      }
    } on FirebaseAuthException catch (ee) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(ee.message)));
    }
  }

  void _phoneNumberVerification(context) async {
    String s = _phone.text;
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91$s',
      verificationCompleted: (phoneAuthCredential) async {
        setState(() {
          showLoading = false;
        });
      },
      verificationFailed: (verificationFailed) async {
        setState(() {
          showLoading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(verificationFailed.message)));
      },
      codeSent: (verificationID, resendingToken) async {
        setState(() {
          showLoading = false;
          currentState = Mobileverification.Show_Otp_Form;
          this.verificationID = verificationID;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
    _otpWidget(context);
  }

  _otpWidget(context) async {
    return showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        title: Text('OTP Verification'),
        content: TextField(
          keyboardType: TextInputType.number,
          controller: _otp,
          decoration: InputDecoration(
            labelText: 'OTP',
            hintText: 'eg: 454581',
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
              onPressed: () async {
                PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationID, smsCode: _otp.text);
                signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              child: Text('Submit'))
        ],
      ),
    );
  }

  Widget _buildNameTF() {
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
          controller: _name,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value.isEmpty) return '*Please enter your name';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.account_circle_rounded,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Name',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]);
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
          controller: _email,
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

  Widget _buildPhoneTF() {
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
          controller: _phone,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value.isEmpty) return '*Please enter your Phone Number';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.phone,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Phone Number',
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
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          // async {
          //   if (_key.currentState.validate()) {
          //     _phoneNumberVerification();
          //   }
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewStudentScreen()),
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

  Widget _buildOrDivider() {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }

  void call() async {
    await Googlesignin.login();
    if (Googlesignin.isSigning) {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewStudentScreen()));
    }
  }

  Widget _buildSocialBtn() {
    return GestureDetector(
      onTap: call,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 10.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/icons/google1.jpg'),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                "REGISTER",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Form(
                  key: _key,
                  child: Column(
                      children: <Widget>[
                        _buildNameTF(),
                        _buildEmailTF(),
                        _buildPhoneTF(),
                        _buildLoginBtn(),
                      ]
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              _buildOrDivider(),
              _buildSocialBtn(),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}