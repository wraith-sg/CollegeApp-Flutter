import 'package:flutter/material.dart';

final kHintTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white70,
  fontFamily: 'OpenSans',
);

final kFFHintTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black38,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kListLabelStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kDecorationStyle = BoxDecoration(
  color: kPrimaryLightColor,
  borderRadius: BorderRadius.circular(29),
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF607D8B),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kFFBoxDecorationStyle = BoxDecoration(
  color: Colors.white38,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const kSecondaryColor = Color(0xFF9949FF);
