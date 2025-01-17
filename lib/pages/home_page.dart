import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stopwatch_tab.dart';
import 'theme_provider.dart';
import 'workoutdetailpage.dart';  // Import WorkoutDetailPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _workouts = [
    'Push Ups',
    'Squats',
    'Lunges',
    'Burpees',
    'Plank',
    'Running',
    'Cycling'
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) => themeProvider.toggleTheme(),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.fitness_center), text: 'Workouts'),
              Tab(icon: Icon(Icons.timer), text: 'Stopwatch'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Workout Search Tab
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Workouts',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (query) {
                      setState(() {
                        _searchQuery = query.toLowerCase();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: _workouts
                        .where((workout) =>
                            workout.toLowerCase().contains(_searchQuery))
                        .map((workout) => ListTile(
                              title: Text(workout),
                              onTap: () {
                                // Navigate to the WorkoutDetailPage
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WorkoutDetailPage(
                                      workoutName: workout,  // Pass the workout name
                                    ),
                                  ),
                                );
                              },
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),

            // Stopwatch Tab
            StopwatchTab(),
          ],
        ),
      ),
    );
  }
}
