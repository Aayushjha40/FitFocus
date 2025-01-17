import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart'; // Import for provider
import 'pages/theme_provider.dart';
import 'pages/getstarthome.dart';
import 'pages/login_page.dart';
import 'pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter binds before Firebase initializes

  // Initialize Firebase based on the platform
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: 'AIzaSyBFBEcslhnSq8SfEUo6Ld-iJmORU2tho3Y',
        appId: '1:229968319813:web:272df55c829b17652b9a2c',
        messagingSenderId: '229968319813',
        projectId: 'fitfocus-334b7',
        authDomain: 'fitfocus-334b7.firebaseapp.com',
        storageBucket: 'fitfocus-334b7.firebasestorage.app',
      ),
    );
  } else {
    await Firebase.initializeApp(); // For Android and iOS
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), // Theme state provider
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
          home: Getstarthome(), // Initial screen
          routes: {
            '/login': (context) => LoginPage(), // Login Page Route
            '/signup': (context) => SignupPage(), // Signup Page Route
          },
        );
      },
    );
  }
}
