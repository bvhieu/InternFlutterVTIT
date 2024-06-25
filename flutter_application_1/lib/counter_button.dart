import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  CounterButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Counter Button',
      child: icon,
    );
  }
}
