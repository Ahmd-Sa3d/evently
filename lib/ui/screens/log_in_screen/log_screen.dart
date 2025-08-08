import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatefulWidget {
  static const String routeName = '/logInScreen';

  const LogScreen({super.key});

  @override
  State<LogScreen> createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  String selectedButton = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(AppImages.logInImage,width: 200,)],
            ),
          ],
        ),
      ),
    );
  }
}
