import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart'; // Import for provider
import 'pages/theme_provider.dart';
import 'pages/getstarthome.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter binds before Firebase initializes
  await Firebase.initializeApp(); // Initializes Firebase

  runApp(
    // Using ChangeNotifierProvider to wrap the app and provide the theme state
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FitFocus',
          theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: Getstarthome(), // Your initial screen
          routes: {
            '/login': (context) => LoginPage(),
            '/signup': (context) => SignupPage(),
          },
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Switcher'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              // Toggle the theme when the button is pressed
              context.read<ThemeProvider>().toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Press the icon to toggle theme'),
      ),
    );
  }
}
