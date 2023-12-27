import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hey_flutter_task/core/constants/app_colors.dart';
import 'package:hey_flutter_task/core/constants/app_constants.dart';

import '../../../core/helpers.dart';
import '../../../core/navigation/app_routes.dart';
import '../../widgets/base_widget.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen(this.email, {Key? key}) : super(key: key);
  final String email;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    if (mounted) {
      _passwordController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, credentialState) {
          if (credentialState is LoginSuccess) {
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pushReplacementNamed(context, AppRoutes.HOME);
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
                    text: 'Login',
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
                            CustomText(
                              text:
                                  'Welcome back, please login to your account ${widget.email}',
                              color: AppColors.TEXT_COLOR,
                              fontSize: 13,
                              maxLines: 3,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 12),
                            TextFieldWidget(
                              title: 'Password',
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                              controller: _passwordController,
                              validation: Helpers.requiredValidation,
                              hint: 'Password',
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
                              } else if (credentialState is LoginIncorrect) {
                                Helpers.showToast(
                                    AppStrings.INVALID_EMAIL_PASSWORD);
                              }
                              return PrimaryButton(
                                text: 'Continue',
                                onPressed: _login,
                              );
                            }),
                            const SizedBox(height: 20),
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

  void _login() {
    if (!_formKey.currentState!.validate()) return;
    BlocProvider.of<LoginCubit>(context).signInUser(
      email: widget.email,
      password: _passwordController.text,
    );
  }
}
