import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piet/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlacementForm extends StatefulWidget {
  @override
  _PlacementFormState createState() => _PlacementFormState();
}

class _PlacementFormState extends State<PlacementForm> {
  final GlobalKey<FormState> _fkey = GlobalKey<FormState>();
  CollectionReference _ref =
      FirebaseFirestore.instance.collection('Placement-Registration');
  TextEditingController _name = TextEditingController();
  TextEditingController _roll = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _course = TextEditingController();
  TextEditingController _class = TextEditingController();
  TextEditingController _postal = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _backlog = TextEditingController();
  TextEditingController _backlogsub = TextEditingController();

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

  Widget _buildRollTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Roll Number', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _roll,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter Your Roll Number';
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
              hintText: 'Enter your Roll Number',
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

  Widget _buildClassTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Class\n*You must be in 6th or above', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _class,
            keyboardType: TextInputType.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans',
            ),
            validator: (value) {
              if (value.isEmpty) return 'Please Enter Your Class';
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
              hintText: 'Enter your Class',
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
              if (value.isEmpty) return 'Please Enter Your Postal Address';
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

  Widget _buildBacklogTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Active Backlogs\n*You have to mention even if result is awaited",
            style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _backlog,
            keyboardType: TextInputType.number,
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
              hintText: 'Enter no. of Active Backlogs',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBacklogSubjectTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Active Backlogs Subjects", style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _backlogsub,
            keyboardType: TextInputType.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              errorStyle: TextStyle(height: 0),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.add_comment,
                color: Colors.black,
              ),
              hintText: 'Enter your Backlog Subjects',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: 150.0,
      child: MaterialButton(
        elevation: 6.0,
        onPressed: () async {
          if (_fkey.currentState.validate()) {
            valid();
            _name.clear();
            _roll.clear();
            _class.clear();
            _phone.clear();
            _email.clear();
            _course.clear();
            _postal.clear();
            _backlog.clear();
            _backlogsub.clear();
            return ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Form submitted successfully')),
            );
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
      "rollno": _roll.text,
      "phone": _phone.text,
      "email": _email.text,
      "course": _course.text,
      "class": _class.text,
      "address": _postal.text,
      "backlog": _backlog.text,
      "backlog-subject": _backlogsub.text,
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
          'Placement Registration Form',
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
                            _buildRollTF(),
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
                            _buildClassTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildBacklogTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildBacklogSubjectTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildPhoneTF(),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.025),
                            _buildEmailTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildAddressTF(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildSubmitBtn(),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
