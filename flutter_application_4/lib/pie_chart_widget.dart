import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pie Chart Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PieChartWidget(),
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            value: 40,
            color: Colors.blue,
            title: '40%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            value: 30,
            color: Colors.red,
            title: '30%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            value: 20,
            color: Colors.green,
            title: '20%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          PieChartSectionData(
            value: 10,
            color: Colors.orange,
            title: '10%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
        centerSpaceRadius: 40,
        sectionsSpace: 2,
      ),
    );
  }
}
