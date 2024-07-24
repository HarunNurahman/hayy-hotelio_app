import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/services/auth_service.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // Proses sign in
      if (event is AuthSignIn) {
        try {
          emit(AuthLoading());
          // Melakukan proses login
          UserModel user = await AuthService().signIn(
            event.email,
            event.password,
          );

          // Mengirimkan state AuthSuccess dengan mengembalikan data user
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // Proses pendaftaran akun
      if (event is AuthSignUp) {
        try {
          // Mengirimkan state AuthLoading
          emit(AuthLoading());
          // Melakukan proses register
          UserModel user = await AuthService().signUp(
            name: event.name,
            email: event.email,
            password: event.password,
          );
          // Mengirimkan state AuthSuccess dengan mengembalikan data user
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // Apabila terdapat session dari AuthGetCurrentUser maka langsung ke dashboard
      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());

          // Mengambil data user dari shared preferences lalu dicek di fungsi getSession
          final UserModel data = await SessionService().getSession();
          // Apabila user sudah login, langsung ke dashboard melalui fungsi signIn dari AuthService
          final UserModel user =
              await AuthService().signIn(data.email!, data.password!);

          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // Jika event AuthSignOut dijalankan
      if (event is AuthSignOut) {
        try {
          emit(AuthLoading());
          await SessionService().deleteSession();
          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
