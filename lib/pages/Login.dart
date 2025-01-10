import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: FocusScope(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo text
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  // Email TextField
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(height: 16.0),
                  // Password TextField
                  TextField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 8.0),
                  // Forgot Password link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Handle forgot password action
                      },
                      child: Text('Forgot Password?'),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  // Login button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1b263b), // Button color
                      foregroundColor: Colors.white, // Text color
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold, // Text bold
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
                    ),
                    onPressed: () {
                      // Handle login action
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(height: 16.0),
                  // Register link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text('Register'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}