import 'package:evently/ui/screens/home_screen/home_screen.dart';
import 'package:evently/ui/screens/on_boarding_screen/customize_first_screen.dart';
import 'package:evently/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393 , 841),
      // Your design size (match your design mockup)
      minTextAdapt: true,
      // Allow text to scale
      splitScreenMode: true,
      // Support different screen sizes
      builder: (context, child) {
        return MaterialApp(
          themeMode: ThemeMode.light,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          debugShowCheckedModeBanner: false,
          initialRoute: "/personalizeScreen",
          routes: {
            '/homeScreen': (_) => HomeScreen(),
            "/personalizeScreen": (_) => CustomizeFirstScreen(),
            "/OnBoardingScreen": (_) => OnBoardingScreen(),
          },
        );
      },
    );
  }
}
