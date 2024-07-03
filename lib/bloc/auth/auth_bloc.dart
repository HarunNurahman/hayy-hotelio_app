import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hayy_hotelio_app/models/user_model.dart';
import 'package:hayy_hotelio_app/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // Jika event adalah event authsignin
      if (event is AuthSignIn) {
        try {
          emit(AuthLoading());
          // Mengambil data dari model user
          UserModel userModel = await AuthService().signIn(
            event.email,
            event.password,
          );
          emit(AuthSuccess(userModel));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthSignUp) {
        try {
          emit(AuthLoading());
          UserModel userModel = await AuthService().signUp(
            name: event.name,
            email: event.email,
            password: event.password,
          );
          emit(AuthSuccess(userModel));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
