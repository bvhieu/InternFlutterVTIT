import 'package:flutter/material.dart';

class SingleScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Scrollview'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 200.0,
              child: Center(
                child: Text('Item 1',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
              ),
            ),
            Container(
              color: Colors.orange,
              height: 200.0,
              child: Center(
                child: Text('Item 2',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
              ),
            ),
            Container(
              color: Colors.green,
              height: 200.0,
              child: Center(
                child: Text('Item 3',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
              ),
            ),
            Container(
              color: Colors.purple,
              height: 200.0,
              child: Center(
                child: Text('Item 4',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
              ),
            ),
            Container(
              color: Colors.red,
              height: 200.0,
              child: Center(
                child: Text('Item 5',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
              ),
            ),
            Container(
              color: Colors.yellow,
              height: 200.0,
              child: Center(
                child: Text('Item 6',
                    style: TextStyle(color: Colors.white, fontSize: 24.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
