import 'package:evently/ui/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static TextStyle lightBlue20Inter700 = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.lightBlue,
    ),
  );
  static TextStyle darkGray16inter500 = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.darkGray,
    ),
  );
  static TextStyle lightBlue20inter500 = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.lightBlue,
    ),
  );static TextStyle white20inter500 = GoogleFonts.inter(
    textStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
  );
}
