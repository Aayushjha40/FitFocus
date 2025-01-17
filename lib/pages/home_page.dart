import 'package:fitness/firebase_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'stopwatch_tab.dart';
import 'theme_provider.dart';
import 'workoutdetailpage.dart'; 
import 'login_page.dart'; // Import LoginPage

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

  void _signOut(BuildContext context) async {
    final FirebaseAuthServices _auth = FirebaseAuthServices();

    await _auth.signOut(); // Sign out from Firebase

    // Redirect to the Login Page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fitness App'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.fitness_center), text: 'Workouts'),
              Tab(icon: Icon(Icons.timer), text: 'Stopwatch'),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                child: Center(
                  child: Text(
                    'Fitness App',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Toggle Theme'),
                trailing: Switch(
                  value: themeProvider.isDarkMode,
                  onChanged: (value) => themeProvider.toggleTheme(),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign Out'),
                onTap: () => _signOut(context),
              ),
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
                                      workoutName: workout, // Pass the workout name
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
