import 'package:evently/ui/re_widget/fill_button_widget.dart';
import 'package:evently/ui/re_widget/text_form_field/text_form_template.dart';
import 'package:evently/ui/re_widget/text_form_field/text_form_type.dart';
import 'package:evently/ui/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = "/forget_password";

  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _emailController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                Image.asset(AppImages.forgetPasswordImage),
                SizedBox(height: 24.h,),
                TextFormTemplate(
                  type: TextFormEnum.email,
                  controller: _emailController,
                ),
                SizedBox(height: 40.h,),
                FillButtonWidget(text: "Reset Password", onTap: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
