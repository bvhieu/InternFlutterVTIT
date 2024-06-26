import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'custom_button.dart';
import 'message_model.dart';
import 'book_model.dart';
import "book_dummy_data.dart";
import 'book_list.dart';

// learn Passing Data via Functions Across Widgets

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MessageModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> items = ['Apple', 'Banana', 'Orange'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //mapping  List & using the spread operator

            ...items.map((item) => Text(item)),
            // Using Third-Party Packages & Adding Google Fonts

            Text('Test Google Fonts',
                style: GoogleFonts.almendra(
                    color: Color.fromARGB(255, 169, 22, 22), fontSize: 16)),
            Consumer<MessageModel>(
              builder: (context, model, child) {
                return Text(
                  model.message,
                  style: TextStyle(fontSize: 24.0),
                );
              },
            ),
            SizedBox(height: 20.0),
            CustomButton(
              text: 'button passing data via functions using the provider',
              icon: Icons.home,
            ),

            SizedBox(height: 60.0),

            // Adding a Data Model & Dummy Data

            Expanded(
              child: BookList(), // Add the BookList widget
            ),
          ],
        ),
      ),
    );
  }
}
