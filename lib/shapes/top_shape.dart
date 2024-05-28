import 'dart:ui';

import 'package:bullet_buddy/shapes/top_path.dart';
import 'package:flutter/material.dart';

class TopShape extends StatelessWidget {
  const TopShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
      child: ClipPath(
        clipper: TopPath(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
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
