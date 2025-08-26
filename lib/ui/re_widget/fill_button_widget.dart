import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FillButtonWidget extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const FillButtonWidget({super.key, required this.text, required this.onTap});

  @override
  State<FillButtonWidget> createState() => _FillButtonWidgetState();
}

class _FillButtonWidgetState extends State<FillButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        minimumSize: Size(361.w, 51.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      onPressed: widget.onTap,
      child: Text(widget.text, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
