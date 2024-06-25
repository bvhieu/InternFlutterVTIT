import 'package:flutter/material.dart';
import 'dart:async';
import 'counter_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Initialize the timer to increment the counter every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_counter < 100)
        setState(() {
          _counter++;
        });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (_counter % 2 == 0)
              Text(
                'Even Number',
                style: TextStyle(color: Colors.green, fontSize: 20),
              )
            else
              Text(
                'Odd Number',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterButton(
                  onPressed: _decrementCounter,
                  icon: Icon(Icons.remove),
                ),
                SizedBox(width: 20),
                CounterButton(
                  onPressed: _incrementCounter,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
