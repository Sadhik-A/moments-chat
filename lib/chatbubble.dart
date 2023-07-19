import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  const Chatbubble({required this.message, required this.isCurrentUserMessage});

  final String message;
  final bool isCurrentUserMessage;

  @override
  Widget build(BuildContext context) {
    var color = isCurrentUserMessage ? Colors.blue : Colors.green;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Text(
        message,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
