import 'dart:async';

import 'package:flutter/material.dart';
import 'package:siskamling/emailInputPage.dart';

import 'main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Siskamling',
      theme: ThemeData(fontFamily: 'Poppins'),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _logoVisible = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _logoVisible = false;
      });
      Timer(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: _logoVisible ? 1.0 : 0.0,
            duration: Duration(seconds: 1),
            child: Center(
              child: Image(
                image: AssetImage('images/logo.png'),
                width: 200.0,
                height: 200.0,
              ),
            ),
          ),
          IgnorePointer(
            ignoring: _logoVisible,
            child: LoginPage(),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();

  bool _isPasswordVisible = false;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  Widget build(BuildContext context) {
    final supabase = SupabaseService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Masukkan Nama Pengguna',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 116, 116, 116)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 80, 65, 65),
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 224, 223, 223),
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 8.0),
            // Password input
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Masukkan Kata Sandi',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                labelStyle: TextStyle(
                  color: Color.fromARGB(255, 80, 65, 65),
                  fontWeight: FontWeight.bold,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 224, 223, 223),
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: _isPasswordVisible
                      ? Icon(Icons.visibility, color: Colors.grey)
                      : Icon(Icons.visibility_off, color: Colors.grey),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            // Forgot Password
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EmailInputPage()));
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                //     final supabase = SupabaseService();
                //     final username = _usernameController.text;
                //     final password = _passwordController.text;
                //     final response = await supabase.client.auth.signIn(
                //       email: username,
                //       password: password,
                //     );
                //     if (response.error == null) {
                //       Navigator.pushReplacement(
                //         context,
                //         MaterialPageRoute(builder: (context) => AlarmScreen()),
                //       );
                //     } else {
                //       print('Authentication failed: ${response.error?.message}');
                //     }
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(200.0, 55.0)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 233, 176, 21)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'Masuk',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
