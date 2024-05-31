import 'package:bullet_buddy/shapes/banner_path.dart';
import 'package:flutter/material.dart';

class BannerShape extends StatelessWidget {
  const BannerShape({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BannerPath(),
      child: Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.dstATop),
              image: const NetworkImage(
                  "https://www.bstudiointerni.com/wp-content/uploads/2015/07/PROGETTAZIONE-INTERNI.jpg"),
              fit: BoxFit.fill,
            ),
          )),
    );
  }
}
