import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  // ignore: strict_top_level_inference
  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {"username": username},
    );
    if (response.user == null) {
      throw Exception("Sign up failed");
    }
  }

  // ignore: strict_top_level_inference
  Future<void> login({required String email, required String password}) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw Exception("Login failed");
    }
  }

  // ignore: strict_top_level_inference
  Future<void> logOut() async {
    await supabase.auth.signOut();
  }
}
