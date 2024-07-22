import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/services/auth_service.dart';
import 'package:hayy_hotelio_app/services/session_service.dart';
import 'package:hayy_hotelio_app/services/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is GetUser) {
        try {
          emit(AuthLoading());
          UserModel user = await UserService().getUserbyId(event.userId);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      // Jika event AuthSignIn dijalankan
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

      // Jika event AuthSignUp dijalankan
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
