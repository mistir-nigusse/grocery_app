import 'package:flutter_bloc/flutter_bloc.dart';
import '../repositories/authentication_respository.dart';

import '../models/user_model.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {
  final String phone;
  final String password;

  AuthenticationInitial({required this.phone, required this.password});
}

class AuthenticationLoading extends AuthenticationState {
  final String phone;
  final String password;

  AuthenticationLoading({required this.phone, required this.password});
}

class AuthenticationSuccess extends AuthenticationState {
  final User user;

  AuthenticationSuccess(this.user);
}

class AuthenticationFailure extends AuthenticationState {
  final String error;
  final String phone;
  final String password;

  AuthenticationFailure(this.error, {required this.phone, required this.password});
}

abstract class AuthenticationEvent {}

class SignInRequested extends AuthenticationEvent {
  final String phone;
  final String password;

  SignInRequested({required this.phone, required this.password});
}

class PhoneChanged extends AuthenticationEvent {
  final String phone;

  PhoneChanged(this.phone);
}

class PasswordChanged extends AuthenticationEvent {
  final String password;

  PasswordChanged(this.password);
}

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc(this.authenticationRepository)
      : super(AuthenticationInitial(phone: '', password: '')) {
    on<SignInRequested>(_onSignInRequested);
    on<PhoneChanged>(_onPhoneChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  void _onSignInRequested(SignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading(phone: event.phone, password: event.password));
    try {
      final user = await authenticationRepository.signIn(event.phone, event.password);
    emit(AuthenticationInitial(phone: user.phone, password: user.password)); // Set the user's phone and password.

      emit(AuthenticationSuccess(user));
    } catch (error) {
      emit(AuthenticationFailure("Failed to sign in: $error", phone: event.phone, password: event.password));
    }
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<AuthenticationState> emit) {
    final currentState = state as AuthenticationInitial;
    emit(AuthenticationInitial(phone: event.phone, password: currentState.password));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<AuthenticationState> emit) {
    final currentState = state as AuthenticationInitial;
    emit(AuthenticationInitial(phone: currentState.phone, password: event.password));
  }
  
}
