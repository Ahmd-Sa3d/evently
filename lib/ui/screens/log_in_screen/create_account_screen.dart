import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/re_widget/fill_button_widget.dart';
import 'package:evently/ui/re_widget/text_form_field/text_form_template.dart';
import 'package:evently/ui/re_widget/text_form_field/text_form_type.dart';
import 'package:evently/ui/screens/home_screen/home_screen_profile.dart';
import 'package:evently/ui/screens/log_in_screen/log_in_screen.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../Provider/language_provider.dart';
import '../../re_widget/select_button_widget.dart';
import '../../utils/app_fonts.dart';
import '../../utils/app_icons.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  static const String routeName = "/createAccountScreen";

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _repassWordController = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Register"), centerTitle: true),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.h,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.nativeScreenImage,
                    height: 250.h,
                  ),
                ),
                TextFormTemplate(
                  type: TextFormEnum.userName,
                  controller: _userController,
                ),
                TextFormTemplate(
                  type: TextFormEnum.email,
                  controller: _emailController,
                ),
                TextFormTemplate(
                  type: TextFormEnum.passWord,
                  controller: _passWordController,
                ),
                TextFormTemplate(
                  type: TextFormEnum.rePassword,
                  controller: _repassWordController,
                  rePassWord: _passWordController,
                ),
                FillButtonWidget(
                  text: AppLocalizations.of(context)!.create_account,
                  onTap: () {
                    if (_key.currentState!.validate()) {
                      Navigator.pushNamed(context, HomeScreenProfile.routeName);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.have_account,
                      style: AppFonts.darkGray16inter500.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          LogInScreen.routeName,
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.login,
                        style: AppFonts.blueItalic17inter700.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
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
