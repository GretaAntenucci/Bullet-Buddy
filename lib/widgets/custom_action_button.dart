import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton(
      {super.key, this.onPressed, required this.icon, required this.title});

  final VoidCallback? onPressed;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.notoSerif(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        SizedBox(
          height: 50,
          child: FloatingActionButton(
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            backgroundColor: theme.colorScheme.secondary,
            elevation: 4,
            onPressed: onPressed,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
