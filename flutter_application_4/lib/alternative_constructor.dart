import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alternative Constructor Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class Expense {
  final String title;
  final double amount;

  // Main constructor
  Expense(this.title, this.amount);

  // Named constructor for zero amount expenses
  Expense.zeroAmount(String title) : this(title, 0.0);

  // Named constructor for a fixed amount
  Expense.fixedAmount(String title, double amount) : this(title, amount);
}

class HomePage extends StatelessWidget {
  final List<Expense> expenses = [
    Expense('Groceries', 50.0),
    Expense('Movies', 15.0),
    Expense('Dinner', 15.0),
    Expense.zeroAmount('Gift'),
    Expense.fixedAmount('Dinner', 30.0),
  ];

  @override
  Widget build(BuildContext context) {
    // Filtering list to only show expenses with amount > 0
    final List<Expense> filteredExpenses =
        expenses.where((expense) => expense.amount > 0).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Alternative Constructor Example'),
      ),
      body: ListView.builder(
        itemCount: filteredExpenses.length,
        itemBuilder: (context, index) {
          final expense = filteredExpenses[index];
          return ListTile(
            title: Text(expense.title),
            subtitle: Text('\$${expense.amount.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
