import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_signup_app/bloc/login_events.dart';
import 'package:login_signup_app/bloc/login_states.dart';
import 'package:login_signup_app/repository/login_repository.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  final LoginRepository loginRepository;

  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChanged>(_changeEmail);
    on<PasswordChanged>(_changePassword);
    on<UserLoginEvent>(_userLogin);
  }

  void _changeEmail(EmailChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _changePassword(PasswordChanged event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _userLogin(UserLoginEvent event, Emitter<LoginStates> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    final response = await loginRepository.login(state.email, state.password);

    if (response['success']) {
      emit(state.copyWith(
        loginStatus: LoginStatus.success,
        message: response['message'],
      ));
    } else {
      emit(state.copyWith(
        loginStatus: LoginStatus.error,
        message: response['message'],
      ));
    }
  }
}
