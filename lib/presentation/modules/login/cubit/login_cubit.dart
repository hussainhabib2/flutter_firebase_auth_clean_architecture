import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_clean_architecture/core/helpers.dart';
import 'package:flutter_firebase_auth_clean_architecture/domain/usecase/firebase_usecases/authentication/sign_in_usecase.dart';

import '../../../../constants/app_constants.dart';
import '../../../../domain/usecase/firebase_usecases/authentication/check_user_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInUseCase? signInUseCase;
  final CheckUserUseCase? checkUserUseCase;

  LoginCubit({this.signInUseCase, this.checkUserUseCase})
      : super(LoginInitial());

  Future<void> signInUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      bool statusTrue = await signInUseCase!.call(email, password);
      if (statusTrue) {
        emit(LoginSuccess());
      } else {
        emit(LoginIncorrect());
      }
    } on SocketException catch (_) {
      Helpers.showToast(AppStrings.SOMETHING_WENT_WRONG);
    } catch (_) {
      emit(LoginIncorrect());
    }
  }

  Future<void> checkUser({required String email}) async {
    emit(LoginLoading());
    try {
      bool statusTrue = await checkUserUseCase!.call(email);
      if (statusTrue) {
        emit(UserExists());
      } else {
        emit(LoginNotExist());
      }
    } on SocketException catch (_) {
      Helpers.showToast(AppStrings.SOMETHING_WENT_WRONG);
    } catch (e) {
      Helpers.showToast(AppStrings.SOMETHING_WENT_WRONG);
      emit(LoginFailure());
    }
  }
}
