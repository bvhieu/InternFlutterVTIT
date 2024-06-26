import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message_model.dart';

// Creating a Reusable, Custom Styled Button

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final IconData? icon;

  CustomButton({
    required this.text,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // More on Button Styling

    return ElevatedButton.icon(
      onPressed: () {
        Provider.of<MessageModel>(context, listen: false)
            .updateMessage('Hello from Child Widget!');
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        textStyle: TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      icon: icon != null ? Icon(icon, size: 20) : Container(),
      label: Text(text),
    );
  }
}
