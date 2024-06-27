import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'result_model.dart';

class ResultsScreen extends StatelessWidget {
  final Map<String, Result> results;

  ResultsScreen({required this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Results'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("Search button clicked");
              })
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: results.entries.map((entry) {
          String key = entry.key;
          Result result = entry.value;

          String formatDate = DateFormat('MMM dd, yyyy').format(result.date);

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key: $key',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Title: ${result.title}',
                          style: TextStyle(fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          'Description: ${result.description}',
                          style: TextStyle(fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    formatDate,
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
