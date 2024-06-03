import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final void Function() action;

  const GradientButton({
    super.key,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.pink[200]!,
              Colors.purple[900]!,
            ],
          ),
        ),
        child: ElevatedButton(
          style: const ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          onPressed: action,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
