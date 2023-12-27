import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:hey_flutter_task/common/custom_field.dart';
import 'package:hey_flutter_task/common/custom_text.dart';
import 'package:hey_flutter_task/core/constants/app_colors.dart';
import 'package:hey_flutter_task/presentation/screens/signup/signup_cubit/signup_cubit.dart';
import 'package:hey_flutter_task/presentation/screens/signup/signup_cubit/signup_state.dart';

import '../../../common/primary_button.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/helpers.dart';
import '../../../core/navigation/app_routes.dart';
import '../../widgets/base_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen(this.email, {Key? key}) : super(key: key);
  final String email;
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    if (mounted) {
      _passwordController.dispose();
      _nameController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, credentialState) {
          if (credentialState is SignupSuccess) {
            Future.delayed(const Duration(milliseconds: 400), () {
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
                    text: 'Sign up',
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  'Looks like you don\'t have an account. Let\'s create a new account for ${widget.email}',
                              color: AppColors.TEXT_COLOR,
                              fontSize: 13,
                              maxLines: 3,
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(height: 20),
                            TextFieldWidget(
                              title: 'Name',
                              textInputType: TextInputType.name,
                              validation: Helpers.requiredValidation,
                              controller: _nameController,
                              hint: 'Name',
                            ),
                            const SizedBox(height: 12),
                            TextFieldWidget(
                              title: 'Password',
                              textInputType: TextInputType.visiblePassword,
                              obscureText: true,
                              controller: _passwordController,
                              validation: Helpers.passwordValidation,
                              hint: 'Password',
                            ),
                            const SizedBox(height: 20),
                            CupertinoButton(
                              onPressed: () {},
                              minSize: 10,
                              padding: EdgeInsets.zero,
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text:
                                        'By selecting Agree and Continue below,',
                                    color: AppColors.TEXT_COLOR,
                                    textAlign: TextAlign.start,
                                    fontSize: 14,
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      CustomText(
                                        text: 'I agree to ',
                                        color: AppColors.TEXT_COLOR,
                                        textAlign: TextAlign.start,
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text:
                                            'Terms of Service & Privacy Policy',
                                        color: AppColors.PRIMARY_COLOR,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            BlocBuilder<SignupCubit, SignupState>(
                                builder: (context, credentialState) {
                              if (credentialState is SignupLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.TEXT_COLOR,
                                  ),
                                );
                              } else if (credentialState is SignupFailure) {
                                Helpers.showToast(
                                    AppStrings.SOMETHING_WENT_WRONG);
                              }
                              return PrimaryButton(
                                text: 'Agree and Continue',
                                onPressed: _signup,
                              );
                            }),
                            const SizedBox(height: 20),
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

  void _signup() {
    if (!_formKey.currentState!.validate()) return;
    BlocProvider.of<SignupCubit>(context).signupUser(
        email: widget.email,
        password: _passwordController.text,
        name: _nameController.text);
  }
}
