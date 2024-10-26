import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static const String supabaseUrl = 'https://sqbdwywnudbveeamruuj.supabase.co';
  static const String supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxYmR3eXdudWRidmVlYW1ydXVqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjk0NjU1MTQsImV4cCI6MjA0NTA0MTUxNH0.6jM0hAP2PZyrkDFY_i54lXmkqETUz4ui7vg-0JRIlaA';

  static Future<void> initialize() async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  }

  static SupabaseClient get client => Supabase.instance.client;
}
