import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/login/cubit/login_cubit.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/login/views/check_user_screen.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/modules/signup/cubit/signup_cubit.dart';

import 'constants/app_constants.dart';
import 'core/di/get_it_injection.dart' as getIt;
import 'core/navigation/app_routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await getIt.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.getIt<LoginCubit>()),
        BlocProvider(create: (_) => getIt.getIt<SignupCubit>()),
      ],
      child: MaterialApp(
        title: AppStrings.APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          primaryColor: Colors.teal,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: getAppRoutes().getRoutes,
        home: const CheckUserScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          );
        },
      ),
    );
  }

  AppRoutes getAppRoutes() {
    return AppRoutes();
  }
}
