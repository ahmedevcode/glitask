import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glitask/feature/register/controller/cubit/register_state.dart';

import '../../../../core/helper/auth_service.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthService _authService;

  RegisterCubit(this._authService) : super(RegisterInitial());

  Future<void> register(String email, String password) async {
    emit(RegisterLoading());
    try {
      User? user =
          await _authService.registerWithEmailAndPassword(email, password);
      if (user != null) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure('Registration failed. Please try again.'));
      }
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
