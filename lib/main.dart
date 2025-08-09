import 'package:evently/ui/screens/home_screen/home_screen.dart';
import 'package:evently/ui/screens/home_screen/intro_screen_shred_pref.dart';
import 'package:evently/ui/screens/log_in_screen/log_in_screen.dart';
import 'package:evently/ui/screens/on_boarding_screen/customize_first_screen.dart';
import 'package:evently/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently/ui/utils/app_theme.dart';
import 'package:evently/ui/utils/firebase_services/fcm_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'firebase_options.dart';

// @pragma('vm:entry-point')
 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
   );
   await FcmServices.init();
   final isIntroScreenOpened = await IntroScreenShredPref.isOnboardingOpened();

   runApp(MyApp(isIntroScreenOpened : isIntroScreenOpened));

}
class MyApp extends StatelessWidget {
  final bool isIntroScreenOpened;
  const MyApp({super.key, required this.isIntroScreenOpened});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 841),
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
          initialRoute:
              isIntroScreenOpened ? "/CustomizeFirstScreen" : "/LogInScreen",
          routes: {
            '/homeScreen': (_) => HomeScreen(),
            "/CustomizeFirstScreen": (_) => CustomizeFirstScreen(),
            "/OnBoardingScreen": (_) => OnBoardingScreen(),
            "/LogInScreen": (_) => LogInScreen(),
          },
        );
      },
    );
  }
}
