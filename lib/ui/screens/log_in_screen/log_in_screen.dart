import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/re_widget/select_button_widget.dart';
import 'package:evently/ui/re_widget/text_form_field/text_form_template.dart';
import 'package:evently/ui/re_widget/text_form_field/text_form_type.dart';
import 'package:evently/ui/screens/home_screen/home_screen_profile.dart';
import 'package:evently/ui/screens/log_in_screen/create_account_screen.dart';
import 'package:evently/ui/screens/log_in_screen/forget_password_screen.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:evently/ui/utils/app_fonts.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../Provider/language_provider.dart';
import '../../re_widget/fill_button_widget.dart';
import '../../utils/app_icons.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = "/LogInScreen";

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

final _keyForm = GlobalKey<FormState>();

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppImages.nativeScreenImage, height: 290.h),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      TextFormTemplate(
                        controller: _emailController,
                        type: TextFormEnum.email,
                      ),
                      SizedBox(height: 16.h),
                      TextFormTemplate(
                        controller: _passWordController,
                        type: TextFormEnum.passWord,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ForgetPasswordScreen.routeName,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forget_password,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                FillButtonWidget(
                  onTap: () {
                    //mark: activate validation
                    //if(_keyForm.currentState!.validate()){Navigator.pushNamed(context, HomeScreenProfile.routeName);}
                    Navigator.pushNamed(context, HomeScreenProfile.routeName);
                  },
                  text: AppLocalizations.of(context)!.login,
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.don_not_have_account,
                      style: AppFonts.darkGray16inter500.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          CreateAccountScreen.routeName,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.create_account,
                        style: AppFonts.blueItalic17inter700.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.lightBlue, // Customize color
                          thickness: 1, // Customize thickness
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Text(
                          "Or",
                          style: AppFonts.lightBlue20inter500.copyWith(
                            fontSize: 15,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Divider(
                          color: AppColors.lightBlue, // Customize color
                          thickness: 1, // Customize thickness
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(minimumSize: Size(361.w, 57.h),
                    backgroundColor: AppColors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),

                      side: BorderSide(color: AppColors.lightBlue),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppICons.googleIcon, width: 40),
                      Text(
                        AppLocalizations.of(context)!.google_login,
                        style: AppFonts.lightBlue20inter500,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),
                
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
          ),
        ),
      ),
    );
  }
}
