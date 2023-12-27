import 'package:flutter/material.dart';
import 'package:hey_flutter_task/core/constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      appBar: AppBar(
        title: Text('Home'),
      ),
    );
  }
}
