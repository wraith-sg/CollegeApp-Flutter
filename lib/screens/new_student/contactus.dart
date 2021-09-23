import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:piet/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUsForm extends StatefulWidget {
  @override
  _ContactUsFormState createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  final GlobalKey<FormState> _fkey = GlobalKey<FormState>();
  CollectionReference _ref = FirebaseFirestore.instance.collection('contactus');
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _message = TextEditingController();

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
              if (value.isEmpty) return 'Enter correct Email';
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
              if (value.isEmpty) return 'Enter Phone Number';
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

  Widget _buildMessageTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Message', style: kListLabelStyle),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kFFBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _message,
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
              hintText: 'Enter your Message',
              hintStyle: kFFHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: 150.0,
      child: MaterialButton(
        elevation: 6.0,
        onPressed: () {
          if (_fkey.currentState.validate()) {
            valid();
            return showDialog(
                context: context,
                builder: (builder) => AlertDialog(
                  content: Text('Submitted!',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  actions: <Widget>[
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () async {
                        _name.clear();
                        _phone.clear();
                        _email.clear();
                        _message.clear();
                        Navigator.of(context).pop();
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
                    )
                  ],
                ));
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

  Widget _buildCallUsText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'You can call us now!\n'
          '\nToll Free No. -  1800 120 6884'
          '\n0180-2569700, 2569799',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  valid() {
    Map<String, dynamic> data = {
      "name": _name.text,
      "phone": _phone.text,
      "email": _email.text,
      "message": _message.text
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
          'Contact Us Form',
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
                            _buildEmailTF(),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildPhoneTF(),
                            SizedBox(
                                height:
                                MediaQuery.of(context).size.height * 0.025,
                            ),
                            _buildMessageTF(),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildSubmitBtn(),
                            SizedBox(
                              height:
                              MediaQuery.of(context).size.height * 0.025,
                              width: MediaQuery.of(context).size.width,
                            ),
                            _buildCallUsText(),
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
