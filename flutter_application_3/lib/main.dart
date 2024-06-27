import 'package:flutter/material.dart';
import 'date_picker.dart';
import 'results_screen.dart';
import 'result_model.dart';
import 'single_child_scroll_view.dart';
import 'textfield_input.dart';

void main() {
  runApp(MyApp());
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
  final Map<String, Result> sampleResults = {
    'key1': Result(
        title: 'Result A', description: 'Description 1a', date: DateTime.now()),
    'key2': Result(
        title: 'Result B', description: 'Description 2b', date: DateTime.now()),
    'key3': Result(
        title: 'Result C', description: 'Description 3c', date: DateTime.now()),
    'key4': Result(
        title: 'Result D', description: 'Description 1a', date: DateTime.now()),
    'key5': Result(
        title: 'Result E', description: 'Description 2b', date: DateTime.now()),
    'key6': Result(
        title: 'Result F', description: 'Description 3c', date: DateTime.now()),
    'key7': Result(
        title: 'Result C', description: 'Description 3c', date: DateTime.now()),
    'key8': Result(
        title: 'Result D', description: 'Description 1a', date: DateTime.now()),
    'key9': Result(
        title: 'Result E', description: 'Description 2b', date: DateTime.now()),
    'key10': Result(
        title: 'Result F', description: 'Description 3c', date: DateTime.now()),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _showModalBottomSheet(context); // Call to show modal bottom sheet
            },
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search button clicked");
              }),
          IconButton(
              icon: Icon(Icons.notification_add_outlined),
              onPressed: () {
                print("Notification button clicked");
              }),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print("Settings button clicked");
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsScreen(results: sampleResults),
                  ),
                );
              },
              child: Text(
                  'Passing data via contructor, Map values, Combining columns and rows, expanded to the rescue'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add navigation logic for the second button
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SingleScrollView(), // Replace with your screen
                  ),
                );
              },
              child: Text('Demo SingleScrollView'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InputScreen()),
                );
              },
              child:
                  Text("Handling User (Text) Input with the TextField Widget"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DatePicker()),
                );
              },
              child: Text("DatePicker"),
            ),
          ],
        ),
      ),
    );
  }
}

void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Model Bottom Sheet'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('close'),
                ),
              ],
            ),
          ),
        );
      });
}
