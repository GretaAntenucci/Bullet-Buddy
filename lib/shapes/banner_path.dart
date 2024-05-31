import 'package:flutter/material.dart';

class BannerPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double midPoint = size.height;

    path.lineTo(0, midPoint);
    path.lineTo(size.width * (1 / 16), midPoint);
    //1
    path.quadraticBezierTo(size.width * (4 / 16), midPoint,
        size.width * (5 / 16), midPoint * (5 / 6));
    //2
    path.quadraticBezierTo(size.width * (6 / 16), midPoint * (2 / 3),
        size.width * (1 / 2), midPoint * (2 / 3));
    //3
    path.quadraticBezierTo(size.width * (10 / 16), midPoint * (2 / 3),
        size.width * (11 / 16), midPoint * (5 / 6));
    //4
    path.quadraticBezierTo(
        size.width * (12 / 16), midPoint, size.width * (15 / 16), midPoint);

    path.lineTo(size.width, midPoint);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
