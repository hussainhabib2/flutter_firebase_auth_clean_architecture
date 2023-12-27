import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hey_flutter_task/common/custom_field.dart';
import 'package:hey_flutter_task/common/custom_text.dart';
import 'package:hey_flutter_task/common/primary_button.dart';
import 'package:hey_flutter_task/core/constants/app_colors.dart';

import '../../../core/helpers.dart';
import '../../../core/navigation/app_routes.dart';
import '../../widgets/base_widget.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_state.dart';

class CheckUserScreen extends StatefulWidget {
  const CheckUserScreen({Key? key}) : super(key: key);

  @override
  State<CheckUserScreen> createState() => _CheckUserScreenState();
}

class _CheckUserScreenState extends State<CheckUserScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passwordController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, credentialState) {
          if (credentialState is UserExists) {
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pushNamed(
                context,
                AppRoutes.LOGIN_SCREEN,
                arguments: _emailController.text,
              );
            });
          }
        },
        builder: (context, credentialState) {
          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: 'Hi!',
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 24),
                  GlassContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFieldWidget(
                              title: 'Email',
                              textInputType: TextInputType.emailAddress,
                              controller: _emailController,
                              validation: Helpers.validateEmail,
                              hint: 'Email',
                            ),
                            const SizedBox(height: 12),
                            BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, credentialState) {
                              if (credentialState is LoginLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.TEXT_COLOR,
                                  ),
                                );
                              } else if (credentialState is LoginNotExist) {
                                Future.delayed(
                                    const Duration(milliseconds: 200), () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.SIGN_UP_SCREEN,
                                    arguments: _emailController.text,
                                  );
                                });
                              }
                              return PrimaryButton(
                                text: 'Continue',
                                onPressed: _checkEmail,
                              );
                            }),
                            const SizedBox(height: 12),
                            const CustomText(
                              text: 'or',
                              color: AppColors.TEXT_COLOR,
                              fontSize: 14,
                            ),
                            const SizedBox(height: 12),
                            PrimaryButton(
                              text: 'Continue with Google',
                              textColor: AppColors.TITLE_COLOR,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal.shade50,
                              icon: Image.asset(
                                'assets/google.png',
                                height: 20,
                              ),
                            ),
                            const SizedBox(height: 12),
                            PrimaryButton(
                              text: 'Continue with Facebook',
                              textColor: AppColors.TITLE_COLOR,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal.shade50,
                              icon: Image.asset(
                                'assets/facebook.png',
                                height: 20,
                              ),
                            ),
                            if (Platform.isIOS) ...[
                              const SizedBox(height: 12),
                              PrimaryButton(
                                text: 'Continue with Apple',
                                textColor: AppColors.TITLE_COLOR,
                                fontWeight: FontWeight.w500,
                                color: Colors.teal.shade50,
                                icon: Image.asset(
                                  'assets/apple.png',
                                  height: 20,
                                ),
                              ),
                            ],
                            const SizedBox(height: 20),
                            CupertinoButton(
                              onPressed: () {},
                              minSize: 10,
                              padding: EdgeInsets.zero,
                              child: const Row(
                                children: [
                                  CustomText(
                                    text: 'Don\'t have an account?',
                                    color: AppColors.TEXT_COLOR,
                                    fontSize: 15,
                                  ),
                                  SizedBox(width: 6),
                                  CustomText(
                                    text: 'Signup',
                                    color: AppColors.PRIMARY_COLOR,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                minSize: 50,
                                onPressed: () {},
                                child: const CustomText(
                                  text: 'Forgot your password?',
                                  color: AppColors.PRIMARY_COLOR,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _checkEmail() {
    if (!_formKey.currentState!.validate()) return;
    BlocProvider.of<LoginCubit>(context).checkUser(
      email: _emailController.text,
    );
  }
}
