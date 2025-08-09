
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = "/LogInScreen";

  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBG,
      body: Column(children: [Image.asset(AppImages.nativeScreenImage)]),
    );
  }
}
