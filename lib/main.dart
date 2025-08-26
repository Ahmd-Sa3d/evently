import 'package:evently/Provider/language_provider.dart';
import 'package:evently/Provider/theme_provider.dart';
import 'package:evently/ui/screens/home_screen/home_screen_profile.dart';
import 'package:evently/shared_pref/intro_screen_shred_pref.dart';
import 'package:evently/ui/screens/log_in_screen/create_account_screen.dart';
import 'package:evently/ui/screens/log_in_screen/forget_password_screen.dart';
import 'package:evently/ui/screens/log_in_screen/log_in_screen.dart';
import 'package:evently/ui/screens/on_boarding_screen/customize_first_screen.dart';
import 'package:evently/ui/screens/on_boarding_screen/on_boarding_screen.dart';
import 'package:evently/ui/utils/app_theme.dart';
import 'package:evently/firebase_services/fcm_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FcmServices.init();
  await FcmServices.getToken();
  await FcmServices.handlingMessage();
  final isIntroScreenOpened = await IntroScreenShredPref.isOnboardingOpened();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(isIntroScreenOpened: isIntroScreenOpened),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isIntroScreenOpened;

  const MyApp({super.key, required this.isIntroScreenOpened});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(393, 841),
      // Your design size (match your design mockup)
      minTextAdapt: true,
      // Allow text to scale
      splitScreenMode: true,
      // Support different screen sizes
      builder: (context, child) {
        return MaterialApp(

          themeMode: themeProvider.currentTheme,
          theme: AppTheme.lightMode,
          darkTheme: AppTheme.darkMode,
          debugShowCheckedModeBanner: false,
          initialRoute:
              //mark : condition of intro screen
             isIntroScreenOpened ? "/CustomizeFirstScreen":"/LogInScreen",
          routes: {
            '/homeScreen': (_) => HomeScreenProfile(),
            "/CustomizeFirstScreen": (_) => CustomizeFirstScreen(),
            "/OnBoardingScreen": (_) => OnBoardingScreen(),
            "/LogInScreen": (_) => LogInScreen(),
            "/forget_password": (_) => ForgetPasswordScreen(),
            "/createAccountScreen": (_) => CreateAccountScreen(),
          },
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(languageProvider.currentLanguage),
        );
      },
    );
  }
}
