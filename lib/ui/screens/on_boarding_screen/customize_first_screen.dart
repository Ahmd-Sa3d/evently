import 'package:evently/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_fonts.dart';
import 'package:evently/ui/utils/app_icons.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeFirstScreen extends StatelessWidget {
  static const String routeName = '/personalizeScreen';

  const CustomizeFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteBG,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(spacing: 28.h,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Image.asset(AppImages.eventlyLogo)),
              Image.asset(AppImages.personalizeScreenImage),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personalize Your Experience',
                  style: AppFonts.lightBlue20Inter700,
                ),
              ),
              Text(
                'Choose your preferred theme and language to get started '
                'with a comfortable, tailored experience that suits your styl',
                style: AppFonts.darkGray16inter500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Language', style: AppFonts.lightBlue20inter500),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightBlue, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      spacing: 17,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(AppICons.americaFlag),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Image.asset(AppICons.egFlag),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Theme', style: AppFonts.lightBlue20inter500),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightBlue, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      spacing: 17,
                      children: [
                        Image.asset(AppICons.sunIcon, color: Color(0xffffa000)),
                        Image.asset(AppICons.moonIcon),
                      ],
                    ),
                  ),
                ],
              ),
              FilledButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all(Size(361.w, 53.h)),
                  backgroundColor: WidgetStateProperty.all(AppColors.lightBlue),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(OnBoardingScreen.routeName);
                },
                child: Text('Let’s Start', style: AppFonts.white20inter500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
