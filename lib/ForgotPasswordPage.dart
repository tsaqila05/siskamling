import 'package:flutter/material.dart';

class PasswordToggle extends StatefulWidget {
  @override
  _PasswordToggleState createState() => _PasswordToggleState();
}

class _PasswordToggleState extends State<PasswordToggle> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: _isPasswordVisible
              ? Icon(Icons.visibility, color: Color.fromARGB(255, 80, 65, 65))
              : Icon(Icons.visibility_off,
                  color: Color.fromARGB(255, 80, 65, 65)),
          onPressed: _togglePasswordVisibility,
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ... other widgets ...
            PasswordToggle(),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}
