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
      if (event is AuthSignIn) {
        try {
          emit(AuthLoading());
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

      // if (event is AuthGetCurrentUser) {
      //   try {
      //     emit(AuthLoading());
      //     UserModel userSession = await SessionService.getUser();

      //     emit(AuthSuccess(userSession));
      //   } catch (e) {
      //     emit(AuthFailed(e.toString()));
      //   }
      // }

      if (event is AuthSignOut) {
        try {
          emit(AuthLoading());
          await SessionService.clearUser();
          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
