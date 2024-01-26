import 'package:supabase/supabase.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  SupabaseClient? _client;

  factory SupabaseService() {
    return _instance;
  }

  SupabaseService._internal();

  void initializeSupabase() {
    if (_client == null) {
      _client = SupabaseClient(
        'https://bkwhqvdhkrrikwnwtvil.supabase.co',
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrd2hxdmRoa3JyaWt3bnd0dmlsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDYwNjM1NzgsImV4cCI6MjAyMTYzOTU3OH0.VRsHj3hS0kzlFIsI49m0B_x05pQgKg0zc_FFqQUfxYw',
      );
    }
  }

  SupabaseClient get client {
    if (_client == null) {
      throw Exception(
          "Supabase client not initialized. Call initializeSupabase() first.");
    }
    return _client!;
  }
}
