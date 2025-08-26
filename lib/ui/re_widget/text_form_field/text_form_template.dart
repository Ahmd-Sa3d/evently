import 'package:evently/ui/re_widget/text_form_field/text_form_type.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';


class TextFormTemplate extends StatefulWidget {
  final TextFormEnum type;
  final TextEditingController controller;
  final TextEditingController? rePassWord;

  const TextFormTemplate({
    super.key,
    required this.type,
    required this.controller,
     this.rePassWord,
  });

  @override
  State<TextFormTemplate> createState() => _EmailFieldState();
}

bool isSecure = true;

class _EmailFieldState extends State<TextFormTemplate> {

  @override
  Widget build(BuildContext context) {
    //this is a widget will pass its value to the TextFormField
    Widget? buildSuffixIcon() {
      // For password field, show visibility toggle
      if (widget.type == TextFormEnum.passWord ||
          widget.type == TextFormEnum.rePassword) {
        return IconButton(
          onPressed: () {
            setState(() {
              isSecure = !isSecure;
            });
          },
          icon:
              isSecure
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
        );
      }
      // For other fields, use their suffixIcon if exists, otherwise return null
      return widget.type.suffixIcon;
    }

    return TextFormField(
      obscureText:
          widget.type == TextFormEnum.passWord ||
                  widget.type == TextFormEnum.rePassword
              ? isSecure
              : widget.type.obscureText,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:widget.type == TextFormEnum.rePassword
          ? widget.type.validator(widget.rePassWord)
          : widget.type.validator(),
      decoration: InputDecoration(
        suffixIcon: buildSuffixIcon(),
        suffixIconColor: Theme.of(context).hintColor,
        hintText: widget.type.hintText(context),
        hintStyle: widget.type.hintStyle(context),
        prefixIcon: widget.type.prefixIcon(context),
        prefixIconColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.grayTextField, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.grayTextField, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.darkRed, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.darkRed, width: 1),
        ),
      ),
    );
  }
}
