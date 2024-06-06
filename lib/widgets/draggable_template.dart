import 'package:flutter/material.dart';

class DraggableTemplate extends StatelessWidget {
  final Widget template;
  final void Function(DraggableDetails) onDragEnd;

  const DraggableTemplate({
    super.key,
    required this.template,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Draggable<Widget>(
        data: template,
        feedback: Material(
          elevation: 6.0,
          child: template,
        ),
        childWhenDragging: Container(
          color: Colors.grey,
          child: const Center(
            child: Text(
              'Dragging...',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        onDragEnd: onDragEnd,
        child: template,
      ),
    );
  }
}
