import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Assuming using fl_chart for demonstration

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Example data for the chart
  final List<BarChartGroupData> _barGroups = [
    BarChartGroupData(x: 0, barRods: [BarChartRodData(fromY: 0, toY: 30)]),
    BarChartGroupData(x: 1, barRods: [BarChartRodData(fromY: 0, toY: 60)]),
    BarChartGroupData(x: 2, barRods: [BarChartRodData(fromY: 0, toY: 90)]),
    // Add more data points here
  ];

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            color: Colors.blue.shade900,
            alignment: Alignment.center,
            child: const Text('Menu',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),

          // ListTile(
          //   title: const Text('Clear Dues'),
          //   onTap: () {
          //     // Handle navigation or state update
          //     Navigator.pop(context);
          //   },
          // ),
          ListTile(
            title: const Text('History'),
            onTap: () {
              // Handle navigation or state update
              Navigator.pop(context);
            },
          ),
          // Add more items here
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation or state update
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/profile');
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Row(
        children: [
          // Drawer is always visible
          Container(
            width: 250, // Adjust the width as needed
            child: _buildDrawer(), // Call the drawer here
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: SizedBox()), // Add space at the start
                        Text(
                          'Current Due:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          textAlign: TextAlign.center,
                          '1 \$BTC', // Example current due, replace with actual data
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red.shade700,
                          ),
                        ),
                        Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 300, // Set the height of the chart
                  width:
                      double.infinity, // Adjusted to take the remaining space
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LineChart(
  LineChartData(
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, 30),
          FlSpot(1, 60),
          FlSpot(2, 90),
          // Add more data points here
        ],
        isCurved: true, // Set to true for curved lines
        // colors: [Colors.blue], // Customize line color
        barWidth: 4, // Adjust line width
        isStrokeCapRound: true, // Round line ends
      ),
    ],
    // Customize your line chart appearance here
  ),
),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
