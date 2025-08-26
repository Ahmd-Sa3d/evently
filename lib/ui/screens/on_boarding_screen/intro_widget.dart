import 'package:evently/ui/screens/on_boarding_screen/on_boarding_data.dart';
import 'package:evently/ui/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  final OnBoardingData data;

  const IntroWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(data.imagePath, fit: BoxFit.contain),
          Text(data.title, style: AppFonts.lightBlue20Inter700),
          Text(
            data.content,
            style: AppFonts.darkGray16inter500.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
