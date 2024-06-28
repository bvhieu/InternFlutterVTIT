import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'dismissible_list_example.dart';
import 'pie_chart_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ColorScheme colorSchemecustom = ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.orange,
    error: Color.fromARGB(255, 242, 170, 164),
    surface: Colors.grey,
    background: Color.fromARGB(255, 221, 95, 95),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Theme Example',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          titleLarge: TextStyle(
              fontSize: 20, fontStyle: FontStyle.italic, color: Colors.grey),
          bodyMedium: TextStyle(
              fontSize: 16, color: const Color.fromARGB(221, 211, 17, 17)),
          labelLarge: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Expense Tracker')),
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                ExpenseForm(),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DismissibleListExample()),
                    );
                  },
                  child: Text(
                    "DismissibleListExample",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                // PieChartWidget(),
              ],
            )),
      ),
    );
  }
}

class ExpenseForm extends StatefulWidget {
  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _saveExpense() {
    if (_formKey.currentState!.validate()) {
      final expense = Expense(
        id: Uuid().v4(),
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        date: DateTime.now(),
      );
      // Here you can save the expense to a list, database, etc.
      print('Expense saved: ${expense.title}, ${expense.amount}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Expense Saved')),
      );
      _formKey.currentState!.reset();
    } else {
      _showErrorDialog('Please fix the errors in the form.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _amountController,
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an amount';
              }
              if (double.tryParse(value) == null || double.parse(value) <= 0) {
                return 'Please enter a valid amount';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: _saveExpense,
              child: Text('Save Expense'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
}

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
