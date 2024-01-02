import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_clean_architecture/constants/app_colors.dart';
import 'package:flutter_firebase_auth_clean_architecture/presentation/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Center(
        child: CustomText(
          color: AppColors.TEXT_COLOR,
          text: 'Home',
        ),
      ),
    );
  }
}
