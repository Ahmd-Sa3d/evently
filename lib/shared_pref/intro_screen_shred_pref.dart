import 'package:shared_preferences/shared_preferences.dart';

class IntroScreenShredPref {
  static const String checkOnboardingKey = 'checkOnBoarding';

  static Future<bool> isOnboardingOpened() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isIntroScreenOpened =
        prefs.getBool(IntroScreenShredPref.checkOnboardingKey) ?? true;
    if(isIntroScreenOpened) {
      await prefs.setBool(
          IntroScreenShredPref.checkOnboardingKey, false);
    }
    return isIntroScreenOpened;
  }
}
