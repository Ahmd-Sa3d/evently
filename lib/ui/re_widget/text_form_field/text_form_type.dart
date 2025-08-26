
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/screens/log_in_screen/validation.dart';
import 'package:evently/ui/utils/app_icons.dart';
import 'package:flutter/material.dart';

enum TextFormEnum { email, passWord, userName, rePassword }

extension TextFormExtension on TextFormEnum {
  String hintText(BuildContext context) {
    switch (this) {
      case TextFormEnum.email:
        return AppLocalizations.of(context)!.email;
      case TextFormEnum.passWord:
        return AppLocalizations.of(context)!.password;
      case TextFormEnum.rePassword:
        return AppLocalizations.of(context)!.re_password;
      case TextFormEnum.userName:
        return AppLocalizations.of(context)!.user_name;
    }
  }

  TextStyle hintStyle(BuildContext context) {
    switch (this) {
      case TextFormEnum.userName:
        return TextStyle(color: Theme.of(context).hintColor);
      case TextFormEnum.email:
        return TextStyle(color: Theme.of(context).hintColor);
      case TextFormEnum.passWord:
        return TextStyle(color: Theme.of(context).hintColor);
      case TextFormEnum.rePassword:
        return TextStyle(color: Theme.of(context).hintColor);
    }
  }

  Widget prefixIcon(BuildContext context) {
    switch (this) {
      case TextFormEnum.email:
        return Image.asset(
          AppICons.prefixEmail,
          color: Theme.of(context).hintColor,
        );
      case TextFormEnum.passWord:
        return Image.asset(
          AppICons.prefixPassWord,
          color: Theme.of(context).hintColor,
        );
      case TextFormEnum.rePassword:
        return Image.asset(
          AppICons.prefixPassWord,
          color: Theme.of(context).hintColor,
        );
      case TextFormEnum.userName:
        return Image.asset(
          AppICons.prefixUser,
          color: Theme.of(context).hintColor,
        );
    }
  }

  Widget? get suffixIcon {
    switch (this) {
      case TextFormEnum.email:
        return null;
      case TextFormEnum.passWord:
        Icon(Icons.visibility_off);
      case TextFormEnum.rePassword:
        Icon(Icons.visibility_off);
      case TextFormEnum.userName:
        return null;
    }
    return null;
  }

  bool get obscureText {
    switch (this) {
      case TextFormEnum.email:
        return false;
      case TextFormEnum.passWord:
        return true;
      case TextFormEnum.rePassword:
        return true;
      case TextFormEnum.userName:
        return false;
    }
  }

  TextInputType get keyBoardType {
    switch (this) {
      case TextFormEnum.email:
        return TextInputType.emailAddress;
      case TextFormEnum.passWord:
        return TextInputType.text;
      case TextFormEnum.rePassword:
        return TextInputType.text;
      case TextFormEnum.userName:
        return TextInputType.text;
    }
  }

  String? Function(String?) validator([TextEditingController? passwordController]) {
    switch (this) {
      case TextFormEnum.email:
        return AppRegex.emailValidator;
      case TextFormEnum.userName:
        return AppRegex.userNAme;
      case TextFormEnum.passWord:
        return AppRegex.passwordValidator;
      case TextFormEnum.rePassword:
        return (value) => AppRegex.rePasswordValidator(
          value,
          passwordController?.text,
        );
    }
  }
}
