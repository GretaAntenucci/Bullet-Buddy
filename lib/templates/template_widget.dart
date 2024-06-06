import 'package:flutter/material.dart';

class TemplateWidget extends StatelessWidget {
  final bool isEditable;
  final String text;
  GlobalKey<FormState>? containerKey;


   TemplateWidget({super.key, required this.isEditable, this.text = '', required this.containerKey,});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: containerKey,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      color: Colors.blueAccent,
      child: Center(
        child: Text(text.isEmpty ? 'Template' : text),
      ),
    );
  }
}
