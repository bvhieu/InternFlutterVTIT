import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Define a TextEditingController to manage the text input's text
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Input'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String email = _emailController.text;
                print('Name: $name, Email: $email');
                // Perform actions with name and email
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
