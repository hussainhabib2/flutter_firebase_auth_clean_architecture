import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hey_flutter_task/domain/usecase/firebase_usecases/authentication/sign_up_usecase.dart';
import 'package:hey_flutter_task/presentation/screens/signup/signup_cubit/signup_state.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/helpers.dart';

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
