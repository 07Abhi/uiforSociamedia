import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    /*is point se apn left side ke end point ko set kiya hai phir wahan se sari line banyege*/
    path.lineTo(0, 4 * size.height / 5);
    Offset curvePoint1 = Offset(size.width / 4, size.height);
    Offset centerPoint = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      centerPoint.dy,
    );
    Offset curvePoint2 = Offset(3 * size.width / 4, 3 * size.height / 5);
    Offset lastPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
        curvePoint2.dx, curvePoint2.dy, lastPoint.dx, lastPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

/*It going to reclip our clipped image when there is update in our curveclipper*/
/*To avoid the this we used false instead of true*/
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
