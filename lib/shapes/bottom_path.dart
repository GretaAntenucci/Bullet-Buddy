import 'package:flutter/material.dart';

class BottomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double midPoint = size.height * (24/36);
    double myHeight = size.height - midPoint;
    double myWidth = size.width*(5/16);

    path.moveTo(0, size.height);
    path.lineTo(0, midPoint);
    //1
    path.quadraticBezierTo(
        myWidth*(10/36), midPoint + myHeight*(3/31),
        myWidth*(9/36), midPoint + myHeight*(6/31)
    );
    //2
    path.quadraticBezierTo(
        myWidth*(9/36), midPoint + myHeight*(8/31),
        myWidth*(7/36), midPoint + myHeight*(12/31)
    );
    //3
    path.quadraticBezierTo(
        myWidth*(7/36), midPoint + myHeight*(13/31),
        myWidth*(7/36), midPoint + myHeight*(15/31)
    );
    //4
    path.quadraticBezierTo(
        myWidth*(9/36), midPoint + myHeight*(20/31),//23/31
        myWidth*(23/36), midPoint + myHeight*(22/31)
    );
    //5
    path.quadraticBezierTo(
        myWidth*(35/36), midPoint + myHeight*(24/31),
        myWidth, midPoint + myHeight*(28/31)
    );
    //6
    path.quadraticBezierTo(
        myWidth, midPoint + myHeight*(30/31),
        myWidth*(34/36), size.height
    );
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}