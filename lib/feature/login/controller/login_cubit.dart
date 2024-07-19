import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/auth_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthService _authService;

  LoginCubit(this._authService) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      User? user =
          await _authService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure('Login failed. Please check your credentials.'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
