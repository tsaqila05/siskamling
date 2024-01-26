import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

import 'loginPage.dart';

void main() {
  SupabaseService().initializeSupabase();
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

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  late SupabaseClient _client;

  factory SupabaseService() {
    return _instance;
  }

  SupabaseService._internal();

  void initializeSupabase() {
    try {
      _client = SupabaseClient(
        'https://bkwhqvdhkrrikwnwtvil.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrd2hxdmRoa3JyaWt3bnd0dmlsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDYwNjM1NzgsImV4cCI6MjAyMTYzOTU3OH0.VRsHj3hS0kzlFIsI49m0B_x05pQgKg0zc_FFqQUfxYw',
      );
    } catch (e) {
      print('Error initializing Supabase: $e');
    }
  }

  SupabaseClient get client {
    if (_client == null) {
      throw Exception(
          "Supabase client not initialized. Call initializeSupabase() first.");
    }
    return _client;
  }
}
