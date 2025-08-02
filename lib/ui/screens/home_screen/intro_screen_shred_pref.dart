import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreenSharedPref extends ChangeNotifier {
  static const String introScreenKey = 'introScreen';

  static Future<bool> isIntroScreenOpened() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isIntroScreenOpened =
        prefs.getBool(IntroScreenSharedPref.introScreenKey) ?? true;
    if (isIntroScreenOpened) {
      await prefs.setBool(IntroScreenSharedPref.introScreenKey, false);
    }
    return isIntroScreenOpened;
  }
}