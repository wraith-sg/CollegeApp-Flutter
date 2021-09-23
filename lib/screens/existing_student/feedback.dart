import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piet/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final GlobalKey<FormState> _fkey = GlobalKey<FormState>();
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('Student-Feedback');
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _course = TextEditingController();
  TextEditingController _postal = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _comment = TextEditingController();

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Name', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _name,
            keyboardType: TextInputType.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter Your Name';
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
              ),
              hintText: 'Enter your Name',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Course', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _course,
            keyboardType: TextInputType.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter Your Course Name';
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.badge,
                color: Colors.black,
              ),
              hintText: 'Enter your Course Name',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Email', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter Your Email';
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
          style: kListLabelStyle,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _phone,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter Your Phone Number';
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.black,
              ),
              hintText: 'Enter your Phone Number',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Address', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _postal,
            keyboardType: TextInputType.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter Your Address';
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.apartment,
                color: Colors.black,
              ),
              hintText: 'Enter your Postal Address',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCommentTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Comment', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _comment,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter This Field';
              return null;
            },
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.add_comment,
                color: Colors.black,
              ),
              hintText: 'Enter your Comment',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      width: 150.0,
      child: MaterialButton(
        elevation: 6.0,
        onPressed: () async {
          if (_fkey.currentState.validate()) {
            valid();
            _name.clear();
            _phone.clear();
            _email.clear();
            _course.clear();
            _postal.clear();
            _comment.clear();
            return ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Form submitted successfully')));
          }
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.black,
        child: Text(
          'SUBMIT',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  valid() {
    Map<String, dynamic> data = {
      "name": _name.text,
      "phone": _phone.text,
      "email": _email.text,
      "course": _course.text,
      "address": _postal.text,
      "comment": _comment.text
    };
    _ref.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'Feedback Form',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              // Container(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              //   // decoration: BoxDecoration(
              //     // gradient: LinearGradient(
              //     //   begin: Alignment.topCenter,
              //     //   end: Alignment.bottomCenter,
              //     //   colors: [
              //     //     Color(0xFF90A4AE),
              //     //     Color(0xFF78909C),
              //     //     Color(0xFF607D8B),
              //     //     Color(0xFF546E7A),
              //     //   ],
              //     //   stops: [0.1, 0.4, 0.6, 0.9],
              //     // ),
              //   // ),
              // ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        key: _fkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildNameTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildCourseTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildEmailTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildPhoneTF(),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025),
                            _buildAddressTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildCommentTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildSubmitBtn(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
