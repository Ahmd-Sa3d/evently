import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectButtonWidget extends StatefulWidget {
  final String icon1;
  final String icon2;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Function(int)? onTap;

  const SelectButtonWidget({
    super.key,
    required this.icon1,
    required this.icon2,
    this.selectedColor,
    this.unSelectedColor,
     this.onTap,
  });

  @override
  State<SelectButtonWidget> createState() => _SelectButtonWidgetState();
}

class _SelectButtonWidgetState extends State<SelectButtonWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<int>.rolling(
      current: value,
      values: [0, 1],
      iconOpacity: 1,
      onChanged: (i) { setState(() => value = i);
      if (widget.onTap != null) {
        widget.onTap?.call(i);
      }
        },
      height: 30.h,
      iconBuilder: (value, foreground) {

        final Color? buttonColor =
            foreground ? widget.selectedColor : widget.unSelectedColor;
        switch (value) {
          case 0:
            return Image.asset(widget.icon1, color: buttonColor);

          case 1:
            return Image.asset(widget.icon2, color: buttonColor);
          default:
            return const SizedBox();
        }
      },
      style: ToggleStyle(
        indicatorColor: AppColors.lightBlue,
        borderColor: AppColors.lightBlue,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
