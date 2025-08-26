import 'package:evently/Provider/language_provider.dart';
import 'package:evently/Provider/theme_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_fonts.dart';
import 'package:evently/ui/utils/app_icons.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../re_widget/select_button_widget.dart';

class CustomizeFirstScreen extends StatefulWidget {
  static const String routeName = '/personalizeScreen';

  const CustomizeFirstScreen({super.key});

  @override
  State<CustomizeFirstScreen> createState() => _CustomizeFirstScreenState();
}

class _CustomizeFirstScreenState extends State<CustomizeFirstScreen> {
  String languageButton = '';
  String moodButton = '';

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            spacing: 28.h,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Image.asset(AppImages.eventlyLogo)),
              Image.asset(AppImages.personalizeScreenImage),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personalize Your Experience',
                  style: AppFonts.lightBlue20Inter700),
              ),
              Text(
                'Choose your preferred theme and language to get started '
                'with a comfortable, tailored experience that suits your styl',
                style: AppFonts.darkGray16inter500.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: AppFonts.lightBlue20inter500,
                  ),
                  //todo : add language button
                  SelectButtonWidget(
                    onTap: (i) {
                      if (i == 0) {
                        languageProvider.changeLanguage("en");
                        setState(() {});
                      } else {
                        languageProvider.changeLanguage("ar");
                        setState(() {});
                      }
                    },
                    icon1: AppICons.americaFlag,
                    icon2: AppICons.egFlag,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: AppFonts.lightBlue20inter500,
                  ),
                  //todo : add language button
                  SelectButtonWidget(
                    onTap: (i) {
                      if (i == 0) {
                        themeProvider.changeTheme(ThemeMode.light);
                        setState(() {});
                      } else {
                        themeProvider.changeTheme(ThemeMode.dark);
                        setState(() {});
                      }
                    },
                    icon1: AppICons.sunIcon,
                    icon2: AppICons.moonIcon,
                    selectedColor: AppColors.white,
                    unSelectedColor: AppColors.lightBlue,
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
                child: Text(
                  AppLocalizations.of(context)!.lets_start,
                  style: AppFonts.white20inter500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
