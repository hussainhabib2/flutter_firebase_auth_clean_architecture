import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_clean_architecture/constants/app_constants.dart';
import 'package:flutter_firebase_auth_clean_architecture/core/helpers.dart';
import 'package:flutter_firebase_auth_clean_architecture/domain/usecase/firebase_usecases/authentication/sign_up_usecase.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/signup/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpUseCase signUpUseCase;

  SignupCubit({required this.signUpUseCase}) : super(SignupInitial());

  Future<void> signupUser(
      {required String email,
      required String name,
      required String password}) async {
    emit(SignupLoading());
    try {
      bool statusTrue = await signUpUseCase.call(email, name, password);
      if (statusTrue) {
        emit(SignupSuccess());
      } else {
        emit(SignupFailure());
      }
    } on SocketException catch (_) {
      Helpers.showToast(AppStrings.SOMETHING_WENT_WRONG);
    } catch (_) {
      emit(SignupFailure());
    }
  }
}
