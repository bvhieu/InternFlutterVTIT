import 'package:flutter/material.dart';

class DismissibleListExample extends StatefulWidget {
  @override
  _DismissibleListExampleState createState() => _DismissibleListExampleState();
}

class _DismissibleListExampleState extends State<DismissibleListExample> {
  final List<String> items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible List Example'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm'),
                    content: Text('Are you sure you want to delete $item?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text('Delete'),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$item dismissed')),
              );
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(item),
            ),
          );
        },
      ),
    );
  }
}
