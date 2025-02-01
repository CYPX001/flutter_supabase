import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<AuthResponse> signUp(String email, String password, String username) async {
    final AuthResponse response = await _supabase.auth.signUp(
      email: email,
      password: password,
    );

    // Guardar el nombre de usuario en la tabla `auth.users`
    if (response.user != null) {
      await _supabase
          .from('users')
          .update({'username': username})
          .eq('id', response.user!.id);
    }

    return response;
  }

  Future<void> SignOut() async{
    await _supabase.auth.signOut();
  }

  String? GetUserEmail(){
    final session =_supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}