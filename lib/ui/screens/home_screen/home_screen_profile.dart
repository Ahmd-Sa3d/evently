import 'package:evently/Provider/language_provider.dart';
import 'package:evently/Provider/theme_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_fonts.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ThemeOption {
  final ThemeMode themeMode;
  final String name;

  ThemeOption(this.themeMode, this.name);
}

class HomeScreenProfile extends StatefulWidget {
  const HomeScreenProfile({super.key});

  static const String routeName = '/homeScreen';

  @override
  State<HomeScreenProfile> createState() => _HomeScreenProfileState();
}

class _HomeScreenProfileState extends State<HomeScreenProfile> {
  String? selectedLanguage;
  String? selectedTheme;

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    final chosenLanguage = [
      {"incode": "en", "decode": AppLocalizations.of(context)!.english},
      {"incode": "ar", "decode": AppLocalizations.of(context)!.arabic},
    ];
    final chosenTheme = [
      ThemeOption(ThemeMode.light, AppLocalizations.of(context)!.light),
      ThemeOption(ThemeMode.dark, AppLocalizations.of(context)!.dark),
      ThemeOption(ThemeMode.system, AppLocalizations.of(context)!.system),
    ];

    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.lightBlue),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(64.r),
                ),
              ),
              width: double.infinity,
              height: 156,
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.only(left: 16.w, bottom: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24.r),
                          bottomLeft: Radius.circular(1000.r),
                          bottomRight: Radius.circular(1000.r),
                          topRight: Radius.circular(1000.r),
                        ),
                        color: AppColors.whiteBG,
                      ),
                      child: Image.asset(AppImages.routeHomeProfile),
                    ),
                    SizedBox(width: 10.w,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h, width: 40.w),
                        Text("John Safwat",style: AppFonts.white24inter700,),
                        Text("johnsafwat.route@gmail.\ncom",style: AppFonts.white16inter500,),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightBlue, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        iconSize: 40,
                        iconEnabledColor: AppColors.lightBlue,
                        style: AppFonts.lightBlue20inter500.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        underline: Container(),
                        isExpanded: true,
                        value: languageProvider.currentLanguage,
                        hint: Text(
                          AppLocalizations.of(context)!.choose_language,
                        ),
                        items:
                            chosenLanguage.map((e) {
                              return DropdownMenuItem<String>(
                                value: e["incode"],
                                child: Text(e["decode"]!),
                              );
                            }).toList(),
                        onChanged: (val) {
                          languageProvider.changeLanguage(val!);
                        },
                      ),
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.theme,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.lightBlue, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                      child: DropdownButton(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        iconSize: 40,
                        iconEnabledColor: AppColors.lightBlue,
                        style: AppFonts.lightBlue20inter500.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        underline: Container(),
                        isExpanded: true,
                        value: themeProvider.currentTheme,
                        hint: Text(AppLocalizations.of(context)!.choose_theme),
                        items:
                            chosenTheme.map((e) {
                              return DropdownMenuItem<ThemeMode>(
                                value: e.themeMode,
                                child: Text(e.name),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            //selectedTheme = value as String;
                            themeProvider.changeTheme(value!);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: Size(361, 56),
                    backgroundColor: AppColors.lightRed,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.logout, color: AppColors.white),
                      Text(
                        AppLocalizations.of(context)!.logout,
                        style: AppFonts.white20inter500,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
