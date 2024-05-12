import 'package:flutter/material.dart';

class TopPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double midPoint = size.height * (2/15);

    path.lineTo(0, midPoint);
    //1
    path.quadraticBezierTo(
        size.width*(2/32), midPoint,
        size.width*(3/32), midPoint*(7/6)
    );
    //2
    path.quadraticBezierTo(
        size.width*(5/32), midPoint*(8/6),
        size.width*(7/32), midPoint*(8/6)
    );
    //3
    path.quadraticBezierTo(
        size.width*(5/16), midPoint*(8/6),
        size.width*(6/16), midPoint
    );
    //4
    path.quadraticBezierTo(
        size.width*(14/32), midPoint*(4/7),
        size.width*(18/32), midPoint*(4/7)
    );
    //5
    path.quadraticBezierTo(
        size.width*(19/32), midPoint*(4/7),
        size.width*(21/32), midPoint*(5/8)
    );
    //6
    path.quadraticBezierTo(
        size.width*(24/32), midPoint*(6/8),
        size.width*(25/32), midPoint*(6/8)
    );
    //7
    path.quadraticBezierTo(
        size.width*(30/32), midPoint*(6/8),
        size.width, 0
    );

    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

