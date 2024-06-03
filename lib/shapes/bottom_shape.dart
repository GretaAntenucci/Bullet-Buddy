import 'dart:ui';

import 'package:bullet_buddy/shapes/bottom_path.dart';
import 'package:flutter/material.dart';

class BottomShape extends StatelessWidget {
  const BottomShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: ClipPath(
        clipper: BottomPath(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pink[200]!,
                Colors.purple[900]!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
