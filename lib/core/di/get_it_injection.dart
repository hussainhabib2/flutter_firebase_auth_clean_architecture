import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_clean_architecture/data/repository/firebase_repository_imp.dart';
import 'package:flutter_firebase_auth_clean_architecture/domain/repository/firebase_repository.dart';
import 'package:flutter_firebase_auth_clean_architecture/domain/usecase/firebase_usecases/authentication/check_user_usecase.dart';
import 'package:flutter_firebase_auth_clean_architecture/domain/usecase/firebase_usecases/authentication/sign_in_usecase.dart';
import 'package:flutter_firebase_auth_clean_architecture/domain/usecase/firebase_usecases/authentication/sign_up_usecase.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/login/cubit/login_cubit.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/signup/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Cubits

  getIt.registerFactory(
    () => LoginCubit(
      signInUseCase: getIt.call(),
      checkUserUseCase: getIt.call(),
    ),
  );

  getIt.registerFactory(
    () => SignupCubit(
      signUpUseCase: getIt.call(),
    ),
  );

  getIt.registerLazySingleton(() => SignInUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(() => SignUpUseCase(repository: getIt.call()));
  getIt.registerLazySingleton(() => CheckUserUseCase(repository: getIt.call()));

  getIt.registerLazySingleton<FirebaseRepository>(() => FirebaseRepositoryImp(
      firebaseFirestore: getIt.call(), firebaseAuth: getIt.call()));

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  getIt.registerLazySingleton(() => firebaseFirestore);
  getIt.registerLazySingleton(() => firebaseAuth);
}
