import 'package:flutter/material.dart';

class NewDiaryPage extends StatelessWidget {
  const NewDiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.orange),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Icon(
            Icons.add,
            size: 120,
            color: Colors.white,
          ),
          Text(
            'New Diary Pge',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
