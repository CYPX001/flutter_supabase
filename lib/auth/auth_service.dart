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
    try {
      // Registrar usuario en Supabase Auth
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      // Verificar si el usuario fue creado correctamente
      if (response.user == null) {
        throw AuthException('No se pudo registrar el usuario.');
      }

      // Obtener el user_id generado por Supabase Auth
      final String userId = response.user!.id;

      // Insertar el usuario en la tabla "users"
      await _supabase
          .from('users')
          .upsert({
            'id': userId,  // Asumiendo que la columna en la tabla se llama 'id'
            'username': username,
            'email': email,
          })
          .select();  // Añadir select() para ejecutar la consulta

      return response;
    } catch (e) {
      if (e is PostgrestException) {
        throw AuthException('Error al guardar en la base de datos: ${e.message}');
      } else if (e is AuthException) {
        rethrow;
      } else {
        throw AuthException('Error durante el registro: $e');
      }
    }
  }

  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  String? getUserEmail() {
    final session = _supabase.auth.currentSession;
    final user = session?.user;
    return user?.email;
  }
}