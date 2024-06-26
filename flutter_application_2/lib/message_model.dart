import 'package:flutter/material.dart';

class MessageModel with ChangeNotifier {
  String _message = 'Hello, Flutter!';

  String get message => _message;

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}
